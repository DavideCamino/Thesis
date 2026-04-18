rule_0 = 'subClass0(C0,C1) :- \n\tsubclass(C0, C1).\n'
for i in range(1, n_unfold):
        rule = 'subClass'+ str(i) + '(C0,C2) :-\n'      +\
               '\tsubClass' + str(i-1) + '(C0,C3),\n'   +\
               '\tsubclass(C3, C2).\n'
