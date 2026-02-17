from qubovert import boolean_var
from dwave.samplers import SimulatedAnnealingSampler

A, B, C, D, E, F  = boolean_var('A'), boolean_var('B'), boolean_var('C'), boolean_var('D'), boolean_var('E'), boolean_var('F')

model = A + B + C + D + E + F
model.add_constraint_OR(A, C, lam=2)
model.add_constraint_OR(A, D, lam=2)
model.add_constraint_OR(A, F, lam=2)
model.add_constraint_OR(B, C, lam=2)
model.add_constraint_OR(B, F, lam=2)
model.add_constraint_OR(D, E, lam=2)
model.add_constraint_OR(E, F, lam=2)

qubo = model.to_qubo()
dwave_qubo = qubo.Q

sampler = SimulatedAnnealingSampler()
result = sampler.sample_qubo(dwave_qubo, num_reads=10)
