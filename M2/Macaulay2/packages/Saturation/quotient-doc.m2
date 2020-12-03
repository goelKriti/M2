undocumented {
    (quotient, Ideal,  Number), (symbol:, Ideal,  Number),
    (quotient, Module, Number), (symbol:, Module, Number)
    }

doc ///
Node
  Key
-- return an ideal
    (quotient, Ideal, Ideal)
    (quotient, Ideal, RingElement)
    (quotient, MonomialIdeal, RingElement)
    (symbol:, Ideal, Ideal)
    (symbol:, Ideal, RingElement)
-- return a module
    (quotient, Module, Ideal)
    (quotient, Module, RingElement)
    (symbol:, Module, Ideal)
    (symbol:, Module, RingElement)
-- return an ideal
    (quotient, Module, Module)
    (symbol:, Module, Module)
    [quotient, MinimalGenerators]
  Headline
    ideal or submodule quotient
  Usage
    quotient(I, J)
    I:J
  Inputs
    I:{Ideal,MonomialIdeal,Module}
    J:{Ideal,MonomialIdeal,Module,RingElement}
    Strategy=>Thing
      specifies the algorithm
    MinimalGenerators=>Boolean
      indicates whether the output should be @TO2 {trim, "trimmed"}@
  Outputs
    :{Ideal,Module}
      the quotient $I:J = \{f | f J\subset I\}$
  Description
    Text
      If @TT "I"@ and @TT "J"@ are both @TO2 (MonomialIdeal, "monomial ideals")@, then the result will be as well.
      If @TT "I"@ and @TT "J"@ are both ideals or submodules of the same module, then the result will be an ideal, otherwise
      if @TT "J"@ is an ideal or ring element, then the result is a submodule containing @TT "I"@.

      The arguments should be ideals in the same ring, or submodules of the same module.
      If the second input @TT "J"@ is a ring element @TT "f"@, then the principal ideal generated by @TT "f"@ is used.
      The infix colon operator @TO symbol:@ may be used as an abbreviation, if no options need to be supplied.

      -- TODO: rewrite with math
      For ideals, the quotient is the set of ring elements $r$ such that $rJ$ is contained in $I$.
      If $I$ is a submodule of a module $M$, and $J$ is an ideal, the quotient is the set of elements $m \in M$
      such that $Jm$ is contained in $I$. Finally, if $I$ and $J$ are submodules of the same module $M$,
      then the result is the set of ring elements $r$ such that $rJ$ is contained in $I$.
    Example
      R = ZZ/32003[a..d];
      J = monomialCurveIdeal(R,{1,4,7})
      I = ideal(J_1-a^2*J_0,J_2-d*c*J_0)
      I : J
    Text
      When needed, Gröbner bases will be computed, and if the computation succeeds the result
      is cached inside the first argument. Partial computations are not yet cached, but this may change in a future version.
    Example
      R = ZZ[a,b,c];
      F = a^3-b^2*c-11*c^2
      I = ideal(F,diff(a,F),diff(b,F),diff(c,F))
      I : (ideal(a,b,c))^3
    Text
      If the arguments are submodules of the same module, the annihilator of @TT "J/I"@ (or @TT "(J+I)/I"@) is returned.
    Example
      S = QQ[x,y,z];
      J = image vars S
      I = image symmetricPower(2,vars S)
      (I++I) : (J++J)
      (I++I) : x+y+z
      quotient(I,J)
      quotient(gens I, gens J)
    Text
      Ideal quotients and saturations are useful for manipulating components of ideals.
    Example
      I = ideal(x^2-y^2, y^3)
      J = ideal((x+y+z)^3, z^2)
      L = intersect(I,J)
      L : z^2
      L : I == J
  SeeAlso
    annihilator
    saturate
    symbol:

Node
  Key
    [quotient, Strategy]
  Description
    Text
      Suppose that @TT "I"@ is the image of a free module @TT "FI"@ in a quotient module @TT "G"@,
      and @TT "J"@ is the image of the free module @TT "FJ"@ in @TT "G"@.

      Available strategies for the computation can be listed using the function @TO hooks@:
    Example
      hooks methods(quotient, Ideal, Ideal)
    Text
      The strategy @TT "Quotient"@ computes the first components of the syzygies of the map
      $R\oplus(FJ^\vee\otimes FI) \to FJ^\vee \otimes G$. The Macaulay2 code for each strategy can be
      viewed using the function @TO code@:
    Example
      code(quotient, Ideal, Ideal, Strategy => Quotient)
    Text
      If @TT "Strategy => Iterate"@ then quotient first computes the quotient @TT "I1"@ by the first generator of @TT "J"@.
      It then checks whether this quotient already annihilates the second generator of @TT "J mod I"@.
      If so, it goes on to the third generator; else it intersects @TT "I1"@ with the quotient of @TT "I"@ by the second
      generator to produce a new @TT "I1"@. It then iterates this process, working through the generators one at a time.

-- TODO: not yet implemented
      To use @TT "Strategy=>Linear"@ the argument @TT "J"@ must be a principal ideal, generated by a linear form.
      A change of variables is made so that this linear form becomes the last variable. Then a reverse lex Gröbner basis
      is used, and the quotient of the initial ideal by the last variable is computed combinatorially.
      This set of monomial is then lifted back to a set of generators for the quotient.

      The following examples show timings for the different strategies.
      @TT "Strategy => Iterate"@ is sometimes faster for ideals with a small number of generators:
    Example
      n = 6
      S = ZZ/101[vars(0..n-1)];
      I = monomialCurveIdeal(S, 1..n-1);
      J = ideal(map(S^1, S^n, (p, q) -> S_q^5));
      time quotient(I^3, J^2, Strategy => Iterate);
      time quotient(I^3, J^2, Strategy => Quotient);
    Text
      @TT "Strategy => Quotient"@ is faster in other cases:
    Example
      S = ZZ/101[vars(0..4)];
      I = ideal vars S;
      time quotient(I^5, I^3, Strategy => Iterate);
      time quotient(I^5, I^3, Strategy => Quotient);
  References
    For further information see for example Exercise 15.41 in Eisenbud's Commutative Algebra with a View Towards Algebraic Geometry.
///