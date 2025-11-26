#! /usr/bin/env python

import dimod
from dwave.system import DWaveSampler, EmbeddingComposite

linear = {'A': 1, 'B': 1, 'C': 1, 'D': 1, 'E': 1, 'F': 1}
quadratic = {('B', 'C'): 2, ('B', 'F'): 2, ('C', 'A'): 2, ('D', 'A'): 2, ('E', 'D'): 2, ('E', 'F'): 2, ('F', 'A'): 2}
bqm = dimod.BinaryQuadraticModel(linear, quadratic, 0, dimod.SPIN)

sampler = EmbeddingComposite(DWaveSampler())
result = sampler.sample(bqm, num_reads=1000, chain_strength=4.0)

data = result.data(fields=["sample", "energy", "num_occurrences"])
wd = max([8] + [len(v) for v in result.variables])
vnames = sorted(result.variables, key=lambda v: ("$" in v, v))
for i in range(len(result.samples())):
    if i > 0:
        print("")
    s = next(data)
    print("Solution #%d (energy = %.4g, tally = %d):\n" % (i + 1, s.energy, s.num_occurrences))
    print("    %-*s  Value" % (wd, "Variable"))
    print("    %s  -----" % ("-"*wd))
    for v in vnames:
        print("    %-*s  %s" % (wd, v, s.sample[v] == 1))
