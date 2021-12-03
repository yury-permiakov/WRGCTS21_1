class ltc_Wrgcts21_1 definition deferred.
class zcl_Wrgcts21_1 definition local friends ltc_Wrgcts21_1.

class ltc_Wrgcts21_1 definition for testing
  duration short
  risk level harmless
.
  private section.
    data:
      f_Cut type ref to zcl_Wrgcts21_1.  "class under test

    methods: sum for testing.
endclass.       "ltc_Wrgcts21_1


class ltc_Wrgcts21_1 implementation.

  method sum.


    f_cut = new #( ).

    cl_Abap_Unit_Assert=>assert_Equals(
      act   = f_cut->sum( 3 )
      exp   = 7         "<--- please adapt expected value
      msg   = 'Testing failed'
*     level =
    ).
  endmethod.




endclass.