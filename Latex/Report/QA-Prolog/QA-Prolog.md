# QA-prolog
Informazioni utili e setup per poter replicare gli esperimenti con QA-prolog.

## Environment setup
### Sistema operativo
Ho eseguito tutti i test in locale e su macchina virtuale. Uso una distro Gnu/Linux, di seguito il risultato del comando `fastfetch` che restituisce tutte le caratteristiche pricipali del sistema:
```text
                  -`                     dadi@ArchConda
                 .o+`                    --------------
                `ooo/                    OS: Arch Linux x86_64
               `+oooo:                   Host: VirtualBox (1.2)
              `+oooooo:                  Kernel: Linux 6.17.8-arch1-1
              -+oooooo+:                 Uptime: 31 seconds
            `/:-:++oooo+:                Packages: 291 (pacman)
           `/++++/+++++++:               Shell: zsh 5.9
          `/++++++++++++++:              Terminal: /dev/pts/0
         `/+++ooooooooooooo/`            CPU: AMD Ryzen 7 PRO 7840U (4) @ 3.29 GHz
        ./ooosssso++osssssso+`           GPU: VMware SVGA II Adapter
       .oossssso-````/ossssss+`          Memory: 502.68 MiB / 7.75 GiB (6%)
      -osssssso.      :ssssssso.         Swap: 0 B / 3.87 GiB (0%)
     :osssssss/        osssso+++.        Disk (/): 14.06 GiB / 61.71 GiB (23%) - ext4
    /ossssssss/        +ssssooo/-        Local IP (enp0s3): 192.168.1.62/24
  `/ossssso+/:-        -:/+osssso+-      Battery (1): 51% [Charging, AC Connected]
 `+sso+:-`                 `.-/+oso:     Locale: en_US.UTF-8
`++:.                           `-/+/
.`                                 `/                            
```
(*I use Arch btw)

### Python
Per quello che facciamo, probabilmente, creare gli ambienti con `python -m venv envname` e attivarli con `source envname/bin/activate` è sufficiente, ma prefesco strumenti con più alto livello di astrazione.

Gestisco gli ambienti python con `conda`. I comandi seguenti servono per creare l'ambiente virtuale e attivarlo. La versione di python che è specificata sembra essere compatibile con tutti i pacchetti che ci serviranno.
```sh
conda create --name quantum python=3.12 pip
conda activate quantum
```
Le librerie che useremo sono tutte contenute dentro la suite Ocean™ di D-Wave. Può essere comodo poter eseguire i Jupyter Notebook. Installiamo ciò che serve con:
```sh
pip install jupyter
pip install dwave-ocean-sdk
```
## QA-prolog
Installiamo tutte le componenti della pipeline che permettono di compilare un programma Prolog in un Hamiltoniana partendo dal fondo, ovvero lo step più vicino all'Hamiltoniana fisica.
### QMASM
[QMASM](https://github.com/lanl/qmasm) permette di trasformare una Hamiltoniana simbolica in una fisica. L'Hamiltoniana sibmolica può contenere macro, variabili e includere altri file di definizione di macro. QMASM non si occupa solo di fare la traduzione, infatte permette anche di:
* esportare il risultato della traduzione in diversi formati;
* "pinnare" alcune variabili in modo da calcolare un Hamiltoniana in cui il valore di queste variabili è fisso;
* fare le chiamate alle API di D-Wave in modo da risolvere direttamente il problema di minimizzazione
* presentare i risultati delle chiamate in modo molto conveniente

Per una lista completa delle funzionalità di QMASM: [QMASM wiki](https://github.com/lanl/qmasm/wiki)

QMASM è scitto in python, ho dovuto modificare il sorgente per renderlo nuovamente compatibile con le API di D-Wave e ho aggiunto un preprocessore prima del parsing del documento. Per installare questo fork di QMASM esegiure:
```sh
git clone https://github.com/DavideCamino/qmasm.git
cd qmasm
python setup.py install
```
È ora possibile etrare nella cartella [Thesis/Code/2_QA-prolog/1_qmasm/](https://github.com/DavideCamino/Thesis/tree/main/Code/2_QA-prolog/1_qmasm) e tradurre *MVC.qmasm* che definisce l'Hamiltoniana di un problema di Minimum Vertex Cover in forma Ising.

Alcune prove che possiamo fare sono: 
* `qmasm --run --solver="tabu" MVC.qmasm`: permette di risolvere il problema di Minimum Vertex Cover;
* `qmasm --format="ocean" -o="MVC_ising.py" --solver="tabu" MVC.qmasm`: generara il file *MVC.py*  contenente il codice python che risolverà il problema. QMASM ignora l'argomento `--solver` nella generazione del codice, ma è necessario aggiungerlo (alla fine del documento più informazioni);
* `qmasm --format="numpy" -o="MVC_qubo.npz" --solver="tabu" MVC.qmasm`: scrive il file *MVC_qubo.npz* in cui vengono salvate le variabili del problema e l'Hamiltoniana fisica in forma matriciale. Questa Hamiltoniana rappresenta il problema in forma QUBO. I dati contenuti in *MVC_qubo.npz* si possono leggere con `numpy.load()`

Il Notebook *MVC_ising.ipynb*  modifica il codice generato in *MVC_ising.py* in modo da poterlo esegiure in locale.

### Verilog
Implementiamo due step della pipeline contemporanemente: da documento Verilog (.v) a circiuto  in formato [EDIF](https://en.wikipedia.org/wiki/EDIF)  a Hamiltoniana simbolica QMASM.

#### Yosys
Il primo step è realizzato da [Yosys](https://yosyshq.net/yosys/), un framework per la sintesi di programmi Verilog. Yosys è disponibile come binario direttamente sul sito ufficiale, ma si trova già pacchettizzato in numerose distribuzioni. Nel mio caso l'ho isntallato con:
```
sudo pacman -S yosys
```
Non è l'ultimissima versione, ma per il nostro fine va bene.
Yosys permette di sintetizzare il programma Verilog in un circuito digitale costituito da porte logiche. Durante la sintesi Yosys ottimizza il circuito riduendo al minimo il nummero di gate (questo è importante perchè non vogliamo generare delle Hamiltoniane troppo grandi).
#### edif2qmasm
[edif2qmasm](https://github.com/lanl/edif2qmasm) si occupa di tradurre il file generato da Yosys in una Hamiltoniana simbolica. Questo software è scritto in [Go](https://go.dev/), per poterlo installare serve è necessario disporre di un compilatore Go, installabile con:
```
sudo pacman -S go
```
È inoltre necessario fare in modo che l'eseguibile venga trovato quando si invoca il comando da terminale, questo può essere fatto modificando la variabile d'ambiente `PATH` nel file *.bashrc* o *.zshrc* aggingendo al file:
```sh
PATH=$PATH:$HOME/go/bin
export PATH
```
#### Test
È ora possibile eseguire gli esperimenti in [Thesis/Code/2_QA-prolog/2_verilog/](https://github.com/DavideCamino/Thesis/tree/main/Code/2_QA-prolog/2_verilog). Per produrre una Hamiltoniana assemblabile da QMASM si eseguono i comandi:
```sh
yosys myfile.v synth.ys -b edif -o myfile.edif
edif2qmasm -o="myfile.qmasm" myfile.edif
```
Risolviamo il problema di soddisfacibilità della formula $A \land(B\lor C)$ con il comando:
```sh
qmasm --solver="sim_anneal" --pin="sat.y := true" --run sat.qmasm
```
E il problema di trovare la scomposizione in fattori di $6$ con
```sh
qmasm --run --pin="mult.product[2:0] := 110" --solver="sim_anneal" mult.qmasm
```
In questi esempi osserviamo come si possano pinnare le variabili in QMASM.

### QA-prolog
L'ultimo step della pipeline prevede la compilazione di un programma Prolog in un programma Verilog. Possiamo installare [QA-prolog](https://github.com/lanl/QA-Prolog) con:
```sh
go install github.com/lanl/QA-Prolog@latest
```
Siamo pronti per esegurire gli esempi in [Thesis/Code/2_QA-prolog/3_QA-prolog/](https://github.com/DavideCamino/Thesis/tree/main/Code/2_QA-prolog/3_QA-prolog). I file *out.md* presenti nelle varie sottocartelle mostrano il comando utilizzato e il risultato ottenuto.