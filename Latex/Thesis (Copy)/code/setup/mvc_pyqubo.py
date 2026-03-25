from pyqubo import Binary, Placeholder, Constraint
from dwave.samplers import SimulatedAnnealingSampler

A, B, C, D, E, F  = Binary('A'), Binary('B'), Binary('C'), Binary('D'), Binary('E'), Binary('F')

H_objective = (A + B + C + D + E + F)
H_penalty = Constraint(((1 - A - C + A*C) +\
(1 - A - D + A*D) +\
(1 - A - F + A*F) +\
(1 - B - C + B*C) +\
(1 - B - F + B*F) +\
(1 - D - E + D*E) +\
(1 - E - F + E*F)) ,label='cnstr0')

L = Placeholder('L')
H = H_objective + L*H_penalty
H_internal = H.compile()
bqm = H_internal.to_bqm(feed_dict={'L': 2})

sampler = SimulatedAnnealingSampler()
result = sampler.sample(bqm, num_reads=10)
