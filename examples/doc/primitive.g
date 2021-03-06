#! @BeginChunk primitive

LoadPackage( "Bialgebroid" );

#! @Example
q := RightQuiver( "q(1)[t:1->1]" );
#! q(1)[t:1->1]
Q := HomalgFieldOfRationals( );
#! Q
Qq := PathAlgebra( Q, q );
#! Q * q
B := Algebroid( Qq );
#! Algebra generated by the right quiver q(1)[t:1->1]

B2 := B^2;
#! Algebra generated by the right quiver qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]

B0 := B^0;
#! Algebra generated by the right quiver *(1)[]

counit_rec := rec( t := 0 );;
comult_rec := rec( t := B2.1xt + B2.tx1 );;
AddBialgebroidStructure( B, counit_rec, comult_rec );
#! Bialgebra generated by the right quiver q(1)[t:1->1]

antipode_rec := rec( t:= -B.t );;
AddAntipode(B, antipode_rec );

counit := Counit( B );
#! Functor from finitely presented Bialgebra generated by the right quiver
#! q(1)[t:1->1] -> Algebra generated by the right quiver *(1)[]

comult := Comultiplication( B );
#! Functor from finitely presented Bialgebra generated by the right quiver
#! q(1)[t:1->1] ->
#! Algebra generated by the right quiver qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]

idB := IdentityFunctor(B);
#! Identity functor of Algebra generated by the right quiver q(1)[t:1->1]

ApplyFunctor( comult, B.t );
#! (1x1)-[{ 1*(tx1) + 1*(1xt) }]->(1x1)

ApplyFunctor( counit, B.t );
#! (1)-[0]->(1)

IsCommutative(B);
#! true

IsCounitary(B);
#! true

IsCocommutative(B);
#! true

IsHopfAlgebroid(B);
#! true

#! @EndExample
#! @EndChunk
