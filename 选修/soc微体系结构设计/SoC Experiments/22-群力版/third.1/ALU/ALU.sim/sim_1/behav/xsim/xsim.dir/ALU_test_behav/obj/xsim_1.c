/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_198(char*, char *);
extern void execute_46(char*, char *);
extern void execute_48(char*, char *);
extern void execute_50(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_197(char*, char *);
extern void execute_184(char*, char *);
extern void execute_56(char*, char *);
extern void execute_72(char*, char *);
extern void execute_59(char*, char *);
extern void execute_196(char*, char *);
extern void execute_187(char*, char *);
extern void execute_188(char*, char *);
extern void execute_190(char*, char *);
extern void execute_192(char*, char *);
extern void execute_193(char*, char *);
extern void execute_195(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_13(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_14(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_70(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[23] = {(funcp)execute_198, (funcp)execute_46, (funcp)execute_48, (funcp)execute_50, (funcp)execute_51, (funcp)execute_52, (funcp)execute_197, (funcp)execute_184, (funcp)execute_56, (funcp)execute_72, (funcp)execute_59, (funcp)execute_196, (funcp)execute_187, (funcp)execute_188, (funcp)execute_190, (funcp)execute_192, (funcp)execute_193, (funcp)execute_195, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_13, (funcp)transaction_14, (funcp)transaction_70};
const int NumRelocateId= 23;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/ALU_test_behav/xsim.reloc",  (void **)funcTab, 23);
	iki_vhdl_file_variable_register(dp + 23872);
	iki_vhdl_file_variable_register(dp + 23928);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/ALU_test_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/ALU_test_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/ALU_test_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/ALU_test_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/ALU_test_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
