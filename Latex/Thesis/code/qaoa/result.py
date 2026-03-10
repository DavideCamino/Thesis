sampler = Sampler(mode=backend)
sampler.options.default_shots = 10000  
pub = (optimized_circuit,)
job = sampler.run([pub], shots=int(1e4))
counts_bin = job.result()[0].data.meas.get_counts()