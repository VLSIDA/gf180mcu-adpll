* Ring Oscillator DCO - SPICE netlist using gf180mcu standard cells
* Auto-generated for CTRL_WIDTH=8
* 512 inverters, 256 taps, 8-level mux tree
*
.subckt ring_dco enable ctrl_0 ctrl_1 ctrl_2 ctrl_3 ctrl_4 ctrl_5 ctrl_6 ctrl_7 clk_out vdd vss

* Enable NAND gate: ring_0 = NAND(enable, fb)
x_nand enable fb ring_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__nand2_1

* 512-stage inverter chain
x_inv0 ring_0 ring_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv1 ring_1 ring_2 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv2 ring_2 ring_3 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv3 ring_3 ring_4 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv4 ring_4 ring_5 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv5 ring_5 ring_6 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv6 ring_6 ring_7 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv7 ring_7 ring_8 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv8 ring_8 ring_9 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv9 ring_9 ring_10 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv10 ring_10 ring_11 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv11 ring_11 ring_12 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv12 ring_12 ring_13 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv13 ring_13 ring_14 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv14 ring_14 ring_15 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv15 ring_15 ring_16 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv16 ring_16 ring_17 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv17 ring_17 ring_18 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv18 ring_18 ring_19 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv19 ring_19 ring_20 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv20 ring_20 ring_21 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv21 ring_21 ring_22 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv22 ring_22 ring_23 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv23 ring_23 ring_24 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv24 ring_24 ring_25 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv25 ring_25 ring_26 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv26 ring_26 ring_27 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv27 ring_27 ring_28 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv28 ring_28 ring_29 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv29 ring_29 ring_30 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv30 ring_30 ring_31 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv31 ring_31 ring_32 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv32 ring_32 ring_33 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv33 ring_33 ring_34 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv34 ring_34 ring_35 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv35 ring_35 ring_36 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv36 ring_36 ring_37 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv37 ring_37 ring_38 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv38 ring_38 ring_39 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv39 ring_39 ring_40 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv40 ring_40 ring_41 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv41 ring_41 ring_42 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv42 ring_42 ring_43 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv43 ring_43 ring_44 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv44 ring_44 ring_45 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv45 ring_45 ring_46 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv46 ring_46 ring_47 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv47 ring_47 ring_48 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv48 ring_48 ring_49 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv49 ring_49 ring_50 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv50 ring_50 ring_51 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv51 ring_51 ring_52 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv52 ring_52 ring_53 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv53 ring_53 ring_54 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv54 ring_54 ring_55 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv55 ring_55 ring_56 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv56 ring_56 ring_57 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv57 ring_57 ring_58 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv58 ring_58 ring_59 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv59 ring_59 ring_60 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv60 ring_60 ring_61 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv61 ring_61 ring_62 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv62 ring_62 ring_63 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv63 ring_63 ring_64 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv64 ring_64 ring_65 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv65 ring_65 ring_66 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv66 ring_66 ring_67 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv67 ring_67 ring_68 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv68 ring_68 ring_69 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv69 ring_69 ring_70 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv70 ring_70 ring_71 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv71 ring_71 ring_72 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv72 ring_72 ring_73 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv73 ring_73 ring_74 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv74 ring_74 ring_75 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv75 ring_75 ring_76 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv76 ring_76 ring_77 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv77 ring_77 ring_78 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv78 ring_78 ring_79 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv79 ring_79 ring_80 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv80 ring_80 ring_81 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv81 ring_81 ring_82 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv82 ring_82 ring_83 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv83 ring_83 ring_84 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv84 ring_84 ring_85 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv85 ring_85 ring_86 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv86 ring_86 ring_87 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv87 ring_87 ring_88 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv88 ring_88 ring_89 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv89 ring_89 ring_90 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv90 ring_90 ring_91 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv91 ring_91 ring_92 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv92 ring_92 ring_93 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv93 ring_93 ring_94 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv94 ring_94 ring_95 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv95 ring_95 ring_96 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv96 ring_96 ring_97 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv97 ring_97 ring_98 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv98 ring_98 ring_99 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv99 ring_99 ring_100 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv100 ring_100 ring_101 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv101 ring_101 ring_102 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv102 ring_102 ring_103 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv103 ring_103 ring_104 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv104 ring_104 ring_105 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv105 ring_105 ring_106 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv106 ring_106 ring_107 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv107 ring_107 ring_108 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv108 ring_108 ring_109 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv109 ring_109 ring_110 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv110 ring_110 ring_111 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv111 ring_111 ring_112 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv112 ring_112 ring_113 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv113 ring_113 ring_114 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv114 ring_114 ring_115 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv115 ring_115 ring_116 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv116 ring_116 ring_117 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv117 ring_117 ring_118 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv118 ring_118 ring_119 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv119 ring_119 ring_120 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv120 ring_120 ring_121 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv121 ring_121 ring_122 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv122 ring_122 ring_123 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv123 ring_123 ring_124 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv124 ring_124 ring_125 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv125 ring_125 ring_126 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv126 ring_126 ring_127 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv127 ring_127 ring_128 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv128 ring_128 ring_129 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv129 ring_129 ring_130 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv130 ring_130 ring_131 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv131 ring_131 ring_132 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv132 ring_132 ring_133 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv133 ring_133 ring_134 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv134 ring_134 ring_135 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv135 ring_135 ring_136 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv136 ring_136 ring_137 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv137 ring_137 ring_138 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv138 ring_138 ring_139 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv139 ring_139 ring_140 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv140 ring_140 ring_141 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv141 ring_141 ring_142 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv142 ring_142 ring_143 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv143 ring_143 ring_144 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv144 ring_144 ring_145 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv145 ring_145 ring_146 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv146 ring_146 ring_147 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv147 ring_147 ring_148 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv148 ring_148 ring_149 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv149 ring_149 ring_150 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv150 ring_150 ring_151 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv151 ring_151 ring_152 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv152 ring_152 ring_153 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv153 ring_153 ring_154 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv154 ring_154 ring_155 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv155 ring_155 ring_156 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv156 ring_156 ring_157 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv157 ring_157 ring_158 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv158 ring_158 ring_159 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv159 ring_159 ring_160 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv160 ring_160 ring_161 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv161 ring_161 ring_162 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv162 ring_162 ring_163 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv163 ring_163 ring_164 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv164 ring_164 ring_165 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv165 ring_165 ring_166 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv166 ring_166 ring_167 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv167 ring_167 ring_168 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv168 ring_168 ring_169 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv169 ring_169 ring_170 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv170 ring_170 ring_171 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv171 ring_171 ring_172 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv172 ring_172 ring_173 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv173 ring_173 ring_174 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv174 ring_174 ring_175 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv175 ring_175 ring_176 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv176 ring_176 ring_177 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv177 ring_177 ring_178 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv178 ring_178 ring_179 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv179 ring_179 ring_180 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv180 ring_180 ring_181 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv181 ring_181 ring_182 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv182 ring_182 ring_183 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv183 ring_183 ring_184 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv184 ring_184 ring_185 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv185 ring_185 ring_186 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv186 ring_186 ring_187 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv187 ring_187 ring_188 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv188 ring_188 ring_189 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv189 ring_189 ring_190 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv190 ring_190 ring_191 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv191 ring_191 ring_192 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv192 ring_192 ring_193 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv193 ring_193 ring_194 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv194 ring_194 ring_195 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv195 ring_195 ring_196 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv196 ring_196 ring_197 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv197 ring_197 ring_198 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv198 ring_198 ring_199 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv199 ring_199 ring_200 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv200 ring_200 ring_201 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv201 ring_201 ring_202 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv202 ring_202 ring_203 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv203 ring_203 ring_204 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv204 ring_204 ring_205 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv205 ring_205 ring_206 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv206 ring_206 ring_207 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv207 ring_207 ring_208 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv208 ring_208 ring_209 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv209 ring_209 ring_210 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv210 ring_210 ring_211 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv211 ring_211 ring_212 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv212 ring_212 ring_213 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv213 ring_213 ring_214 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv214 ring_214 ring_215 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv215 ring_215 ring_216 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv216 ring_216 ring_217 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv217 ring_217 ring_218 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv218 ring_218 ring_219 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv219 ring_219 ring_220 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv220 ring_220 ring_221 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv221 ring_221 ring_222 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv222 ring_222 ring_223 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv223 ring_223 ring_224 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv224 ring_224 ring_225 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv225 ring_225 ring_226 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv226 ring_226 ring_227 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv227 ring_227 ring_228 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv228 ring_228 ring_229 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv229 ring_229 ring_230 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv230 ring_230 ring_231 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv231 ring_231 ring_232 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv232 ring_232 ring_233 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv233 ring_233 ring_234 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv234 ring_234 ring_235 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv235 ring_235 ring_236 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv236 ring_236 ring_237 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv237 ring_237 ring_238 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv238 ring_238 ring_239 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv239 ring_239 ring_240 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv240 ring_240 ring_241 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv241 ring_241 ring_242 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv242 ring_242 ring_243 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv243 ring_243 ring_244 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv244 ring_244 ring_245 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv245 ring_245 ring_246 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv246 ring_246 ring_247 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv247 ring_247 ring_248 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv248 ring_248 ring_249 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv249 ring_249 ring_250 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv250 ring_250 ring_251 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv251 ring_251 ring_252 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv252 ring_252 ring_253 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv253 ring_253 ring_254 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv254 ring_254 ring_255 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv255 ring_255 ring_256 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv256 ring_256 ring_257 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv257 ring_257 ring_258 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv258 ring_258 ring_259 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv259 ring_259 ring_260 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv260 ring_260 ring_261 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv261 ring_261 ring_262 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv262 ring_262 ring_263 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv263 ring_263 ring_264 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv264 ring_264 ring_265 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv265 ring_265 ring_266 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv266 ring_266 ring_267 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv267 ring_267 ring_268 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv268 ring_268 ring_269 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv269 ring_269 ring_270 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv270 ring_270 ring_271 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv271 ring_271 ring_272 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv272 ring_272 ring_273 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv273 ring_273 ring_274 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv274 ring_274 ring_275 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv275 ring_275 ring_276 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv276 ring_276 ring_277 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv277 ring_277 ring_278 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv278 ring_278 ring_279 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv279 ring_279 ring_280 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv280 ring_280 ring_281 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv281 ring_281 ring_282 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv282 ring_282 ring_283 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv283 ring_283 ring_284 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv284 ring_284 ring_285 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv285 ring_285 ring_286 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv286 ring_286 ring_287 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv287 ring_287 ring_288 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv288 ring_288 ring_289 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv289 ring_289 ring_290 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv290 ring_290 ring_291 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv291 ring_291 ring_292 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv292 ring_292 ring_293 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv293 ring_293 ring_294 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv294 ring_294 ring_295 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv295 ring_295 ring_296 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv296 ring_296 ring_297 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv297 ring_297 ring_298 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv298 ring_298 ring_299 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv299 ring_299 ring_300 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv300 ring_300 ring_301 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv301 ring_301 ring_302 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv302 ring_302 ring_303 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv303 ring_303 ring_304 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv304 ring_304 ring_305 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv305 ring_305 ring_306 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv306 ring_306 ring_307 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv307 ring_307 ring_308 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv308 ring_308 ring_309 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv309 ring_309 ring_310 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv310 ring_310 ring_311 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv311 ring_311 ring_312 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv312 ring_312 ring_313 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv313 ring_313 ring_314 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv314 ring_314 ring_315 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv315 ring_315 ring_316 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv316 ring_316 ring_317 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv317 ring_317 ring_318 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv318 ring_318 ring_319 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv319 ring_319 ring_320 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv320 ring_320 ring_321 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv321 ring_321 ring_322 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv322 ring_322 ring_323 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv323 ring_323 ring_324 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv324 ring_324 ring_325 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv325 ring_325 ring_326 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv326 ring_326 ring_327 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv327 ring_327 ring_328 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv328 ring_328 ring_329 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv329 ring_329 ring_330 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv330 ring_330 ring_331 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv331 ring_331 ring_332 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv332 ring_332 ring_333 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv333 ring_333 ring_334 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv334 ring_334 ring_335 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv335 ring_335 ring_336 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv336 ring_336 ring_337 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv337 ring_337 ring_338 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv338 ring_338 ring_339 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv339 ring_339 ring_340 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv340 ring_340 ring_341 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv341 ring_341 ring_342 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv342 ring_342 ring_343 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv343 ring_343 ring_344 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv344 ring_344 ring_345 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv345 ring_345 ring_346 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv346 ring_346 ring_347 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv347 ring_347 ring_348 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv348 ring_348 ring_349 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv349 ring_349 ring_350 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv350 ring_350 ring_351 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv351 ring_351 ring_352 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv352 ring_352 ring_353 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv353 ring_353 ring_354 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv354 ring_354 ring_355 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv355 ring_355 ring_356 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv356 ring_356 ring_357 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv357 ring_357 ring_358 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv358 ring_358 ring_359 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv359 ring_359 ring_360 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv360 ring_360 ring_361 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv361 ring_361 ring_362 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv362 ring_362 ring_363 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv363 ring_363 ring_364 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv364 ring_364 ring_365 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv365 ring_365 ring_366 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv366 ring_366 ring_367 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv367 ring_367 ring_368 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv368 ring_368 ring_369 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv369 ring_369 ring_370 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv370 ring_370 ring_371 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv371 ring_371 ring_372 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv372 ring_372 ring_373 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv373 ring_373 ring_374 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv374 ring_374 ring_375 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv375 ring_375 ring_376 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv376 ring_376 ring_377 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv377 ring_377 ring_378 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv378 ring_378 ring_379 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv379 ring_379 ring_380 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv380 ring_380 ring_381 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv381 ring_381 ring_382 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv382 ring_382 ring_383 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv383 ring_383 ring_384 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv384 ring_384 ring_385 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv385 ring_385 ring_386 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv386 ring_386 ring_387 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv387 ring_387 ring_388 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv388 ring_388 ring_389 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv389 ring_389 ring_390 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv390 ring_390 ring_391 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv391 ring_391 ring_392 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv392 ring_392 ring_393 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv393 ring_393 ring_394 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv394 ring_394 ring_395 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv395 ring_395 ring_396 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv396 ring_396 ring_397 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv397 ring_397 ring_398 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv398 ring_398 ring_399 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv399 ring_399 ring_400 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv400 ring_400 ring_401 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv401 ring_401 ring_402 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv402 ring_402 ring_403 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv403 ring_403 ring_404 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv404 ring_404 ring_405 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv405 ring_405 ring_406 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv406 ring_406 ring_407 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv407 ring_407 ring_408 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv408 ring_408 ring_409 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv409 ring_409 ring_410 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv410 ring_410 ring_411 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv411 ring_411 ring_412 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv412 ring_412 ring_413 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv413 ring_413 ring_414 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv414 ring_414 ring_415 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv415 ring_415 ring_416 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv416 ring_416 ring_417 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv417 ring_417 ring_418 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv418 ring_418 ring_419 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv419 ring_419 ring_420 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv420 ring_420 ring_421 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv421 ring_421 ring_422 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv422 ring_422 ring_423 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv423 ring_423 ring_424 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv424 ring_424 ring_425 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv425 ring_425 ring_426 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv426 ring_426 ring_427 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv427 ring_427 ring_428 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv428 ring_428 ring_429 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv429 ring_429 ring_430 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv430 ring_430 ring_431 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv431 ring_431 ring_432 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv432 ring_432 ring_433 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv433 ring_433 ring_434 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv434 ring_434 ring_435 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv435 ring_435 ring_436 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv436 ring_436 ring_437 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv437 ring_437 ring_438 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv438 ring_438 ring_439 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv439 ring_439 ring_440 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv440 ring_440 ring_441 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv441 ring_441 ring_442 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv442 ring_442 ring_443 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv443 ring_443 ring_444 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv444 ring_444 ring_445 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv445 ring_445 ring_446 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv446 ring_446 ring_447 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv447 ring_447 ring_448 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv448 ring_448 ring_449 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv449 ring_449 ring_450 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv450 ring_450 ring_451 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv451 ring_451 ring_452 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv452 ring_452 ring_453 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv453 ring_453 ring_454 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv454 ring_454 ring_455 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv455 ring_455 ring_456 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv456 ring_456 ring_457 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv457 ring_457 ring_458 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv458 ring_458 ring_459 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv459 ring_459 ring_460 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv460 ring_460 ring_461 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv461 ring_461 ring_462 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv462 ring_462 ring_463 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv463 ring_463 ring_464 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv464 ring_464 ring_465 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv465 ring_465 ring_466 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv466 ring_466 ring_467 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv467 ring_467 ring_468 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv468 ring_468 ring_469 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv469 ring_469 ring_470 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv470 ring_470 ring_471 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv471 ring_471 ring_472 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv472 ring_472 ring_473 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv473 ring_473 ring_474 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv474 ring_474 ring_475 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv475 ring_475 ring_476 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv476 ring_476 ring_477 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv477 ring_477 ring_478 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv478 ring_478 ring_479 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv479 ring_479 ring_480 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv480 ring_480 ring_481 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv481 ring_481 ring_482 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv482 ring_482 ring_483 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv483 ring_483 ring_484 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv484 ring_484 ring_485 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv485 ring_485 ring_486 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv486 ring_486 ring_487 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv487 ring_487 ring_488 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv488 ring_488 ring_489 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv489 ring_489 ring_490 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv490 ring_490 ring_491 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv491 ring_491 ring_492 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv492 ring_492 ring_493 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv493 ring_493 ring_494 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv494 ring_494 ring_495 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv495 ring_495 ring_496 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv496 ring_496 ring_497 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv497 ring_497 ring_498 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv498 ring_498 ring_499 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv499 ring_499 ring_500 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv500 ring_500 ring_501 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv501 ring_501 ring_502 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv502 ring_502 ring_503 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv503 ring_503 ring_504 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv504 ring_504 ring_505 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv505 ring_505 ring_506 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv506 ring_506 ring_507 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv507 ring_507 ring_508 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv508 ring_508 ring_509 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv509 ring_509 ring_510 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv510 ring_510 ring_511 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1
x_inv511 ring_511 ring_512 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1

* 256:1 feedback mux (8-level binary tree of mux2 cells)
* mux2 ports: I0 I1 S Z VDD VNW VPW VSS

* Level 0: select on ctrl_0
x_mux_0_0 ring_512 ring_510 ctrl_0 m0_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_1 ring_508 ring_506 ctrl_0 m0_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_2 ring_504 ring_502 ctrl_0 m0_2 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_3 ring_500 ring_498 ctrl_0 m0_3 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_4 ring_496 ring_494 ctrl_0 m0_4 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_5 ring_492 ring_490 ctrl_0 m0_5 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_6 ring_488 ring_486 ctrl_0 m0_6 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_7 ring_484 ring_482 ctrl_0 m0_7 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_8 ring_480 ring_478 ctrl_0 m0_8 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_9 ring_476 ring_474 ctrl_0 m0_9 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_10 ring_472 ring_470 ctrl_0 m0_10 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_11 ring_468 ring_466 ctrl_0 m0_11 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_12 ring_464 ring_462 ctrl_0 m0_12 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_13 ring_460 ring_458 ctrl_0 m0_13 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_14 ring_456 ring_454 ctrl_0 m0_14 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_15 ring_452 ring_450 ctrl_0 m0_15 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_16 ring_448 ring_446 ctrl_0 m0_16 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_17 ring_444 ring_442 ctrl_0 m0_17 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_18 ring_440 ring_438 ctrl_0 m0_18 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_19 ring_436 ring_434 ctrl_0 m0_19 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_20 ring_432 ring_430 ctrl_0 m0_20 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_21 ring_428 ring_426 ctrl_0 m0_21 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_22 ring_424 ring_422 ctrl_0 m0_22 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_23 ring_420 ring_418 ctrl_0 m0_23 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_24 ring_416 ring_414 ctrl_0 m0_24 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_25 ring_412 ring_410 ctrl_0 m0_25 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_26 ring_408 ring_406 ctrl_0 m0_26 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_27 ring_404 ring_402 ctrl_0 m0_27 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_28 ring_400 ring_398 ctrl_0 m0_28 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_29 ring_396 ring_394 ctrl_0 m0_29 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_30 ring_392 ring_390 ctrl_0 m0_30 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_31 ring_388 ring_386 ctrl_0 m0_31 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_32 ring_384 ring_382 ctrl_0 m0_32 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_33 ring_380 ring_378 ctrl_0 m0_33 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_34 ring_376 ring_374 ctrl_0 m0_34 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_35 ring_372 ring_370 ctrl_0 m0_35 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_36 ring_368 ring_366 ctrl_0 m0_36 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_37 ring_364 ring_362 ctrl_0 m0_37 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_38 ring_360 ring_358 ctrl_0 m0_38 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_39 ring_356 ring_354 ctrl_0 m0_39 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_40 ring_352 ring_350 ctrl_0 m0_40 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_41 ring_348 ring_346 ctrl_0 m0_41 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_42 ring_344 ring_342 ctrl_0 m0_42 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_43 ring_340 ring_338 ctrl_0 m0_43 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_44 ring_336 ring_334 ctrl_0 m0_44 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_45 ring_332 ring_330 ctrl_0 m0_45 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_46 ring_328 ring_326 ctrl_0 m0_46 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_47 ring_324 ring_322 ctrl_0 m0_47 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_48 ring_320 ring_318 ctrl_0 m0_48 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_49 ring_316 ring_314 ctrl_0 m0_49 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_50 ring_312 ring_310 ctrl_0 m0_50 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_51 ring_308 ring_306 ctrl_0 m0_51 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_52 ring_304 ring_302 ctrl_0 m0_52 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_53 ring_300 ring_298 ctrl_0 m0_53 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_54 ring_296 ring_294 ctrl_0 m0_54 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_55 ring_292 ring_290 ctrl_0 m0_55 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_56 ring_288 ring_286 ctrl_0 m0_56 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_57 ring_284 ring_282 ctrl_0 m0_57 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_58 ring_280 ring_278 ctrl_0 m0_58 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_59 ring_276 ring_274 ctrl_0 m0_59 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_60 ring_272 ring_270 ctrl_0 m0_60 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_61 ring_268 ring_266 ctrl_0 m0_61 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_62 ring_264 ring_262 ctrl_0 m0_62 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_63 ring_260 ring_258 ctrl_0 m0_63 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_64 ring_256 ring_254 ctrl_0 m0_64 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_65 ring_252 ring_250 ctrl_0 m0_65 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_66 ring_248 ring_246 ctrl_0 m0_66 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_67 ring_244 ring_242 ctrl_0 m0_67 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_68 ring_240 ring_238 ctrl_0 m0_68 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_69 ring_236 ring_234 ctrl_0 m0_69 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_70 ring_232 ring_230 ctrl_0 m0_70 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_71 ring_228 ring_226 ctrl_0 m0_71 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_72 ring_224 ring_222 ctrl_0 m0_72 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_73 ring_220 ring_218 ctrl_0 m0_73 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_74 ring_216 ring_214 ctrl_0 m0_74 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_75 ring_212 ring_210 ctrl_0 m0_75 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_76 ring_208 ring_206 ctrl_0 m0_76 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_77 ring_204 ring_202 ctrl_0 m0_77 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_78 ring_200 ring_198 ctrl_0 m0_78 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_79 ring_196 ring_194 ctrl_0 m0_79 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_80 ring_192 ring_190 ctrl_0 m0_80 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_81 ring_188 ring_186 ctrl_0 m0_81 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_82 ring_184 ring_182 ctrl_0 m0_82 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_83 ring_180 ring_178 ctrl_0 m0_83 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_84 ring_176 ring_174 ctrl_0 m0_84 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_85 ring_172 ring_170 ctrl_0 m0_85 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_86 ring_168 ring_166 ctrl_0 m0_86 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_87 ring_164 ring_162 ctrl_0 m0_87 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_88 ring_160 ring_158 ctrl_0 m0_88 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_89 ring_156 ring_154 ctrl_0 m0_89 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_90 ring_152 ring_150 ctrl_0 m0_90 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_91 ring_148 ring_146 ctrl_0 m0_91 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_92 ring_144 ring_142 ctrl_0 m0_92 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_93 ring_140 ring_138 ctrl_0 m0_93 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_94 ring_136 ring_134 ctrl_0 m0_94 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_95 ring_132 ring_130 ctrl_0 m0_95 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_96 ring_128 ring_126 ctrl_0 m0_96 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_97 ring_124 ring_122 ctrl_0 m0_97 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_98 ring_120 ring_118 ctrl_0 m0_98 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_99 ring_116 ring_114 ctrl_0 m0_99 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_100 ring_112 ring_110 ctrl_0 m0_100 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_101 ring_108 ring_106 ctrl_0 m0_101 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_102 ring_104 ring_102 ctrl_0 m0_102 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_103 ring_100 ring_98 ctrl_0 m0_103 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_104 ring_96 ring_94 ctrl_0 m0_104 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_105 ring_92 ring_90 ctrl_0 m0_105 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_106 ring_88 ring_86 ctrl_0 m0_106 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_107 ring_84 ring_82 ctrl_0 m0_107 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_108 ring_80 ring_78 ctrl_0 m0_108 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_109 ring_76 ring_74 ctrl_0 m0_109 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_110 ring_72 ring_70 ctrl_0 m0_110 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_111 ring_68 ring_66 ctrl_0 m0_111 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_112 ring_64 ring_62 ctrl_0 m0_112 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_113 ring_60 ring_58 ctrl_0 m0_113 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_114 ring_56 ring_54 ctrl_0 m0_114 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_115 ring_52 ring_50 ctrl_0 m0_115 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_116 ring_48 ring_46 ctrl_0 m0_116 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_117 ring_44 ring_42 ctrl_0 m0_117 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_118 ring_40 ring_38 ctrl_0 m0_118 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_119 ring_36 ring_34 ctrl_0 m0_119 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_120 ring_32 ring_30 ctrl_0 m0_120 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_121 ring_28 ring_26 ctrl_0 m0_121 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_122 ring_24 ring_22 ctrl_0 m0_122 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_123 ring_20 ring_18 ctrl_0 m0_123 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_124 ring_16 ring_14 ctrl_0 m0_124 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_125 ring_12 ring_10 ctrl_0 m0_125 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_126 ring_8 ring_6 ctrl_0 m0_126 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_0_127 ring_4 ring_2 ctrl_0 m0_127 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Level 1: select on ctrl_1
x_mux_1_0 m0_0 m0_1 ctrl_1 m1_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_1 m0_2 m0_3 ctrl_1 m1_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_2 m0_4 m0_5 ctrl_1 m1_2 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_3 m0_6 m0_7 ctrl_1 m1_3 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_4 m0_8 m0_9 ctrl_1 m1_4 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_5 m0_10 m0_11 ctrl_1 m1_5 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_6 m0_12 m0_13 ctrl_1 m1_6 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_7 m0_14 m0_15 ctrl_1 m1_7 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_8 m0_16 m0_17 ctrl_1 m1_8 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_9 m0_18 m0_19 ctrl_1 m1_9 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_10 m0_20 m0_21 ctrl_1 m1_10 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_11 m0_22 m0_23 ctrl_1 m1_11 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_12 m0_24 m0_25 ctrl_1 m1_12 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_13 m0_26 m0_27 ctrl_1 m1_13 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_14 m0_28 m0_29 ctrl_1 m1_14 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_15 m0_30 m0_31 ctrl_1 m1_15 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_16 m0_32 m0_33 ctrl_1 m1_16 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_17 m0_34 m0_35 ctrl_1 m1_17 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_18 m0_36 m0_37 ctrl_1 m1_18 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_19 m0_38 m0_39 ctrl_1 m1_19 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_20 m0_40 m0_41 ctrl_1 m1_20 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_21 m0_42 m0_43 ctrl_1 m1_21 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_22 m0_44 m0_45 ctrl_1 m1_22 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_23 m0_46 m0_47 ctrl_1 m1_23 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_24 m0_48 m0_49 ctrl_1 m1_24 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_25 m0_50 m0_51 ctrl_1 m1_25 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_26 m0_52 m0_53 ctrl_1 m1_26 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_27 m0_54 m0_55 ctrl_1 m1_27 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_28 m0_56 m0_57 ctrl_1 m1_28 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_29 m0_58 m0_59 ctrl_1 m1_29 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_30 m0_60 m0_61 ctrl_1 m1_30 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_31 m0_62 m0_63 ctrl_1 m1_31 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_32 m0_64 m0_65 ctrl_1 m1_32 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_33 m0_66 m0_67 ctrl_1 m1_33 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_34 m0_68 m0_69 ctrl_1 m1_34 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_35 m0_70 m0_71 ctrl_1 m1_35 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_36 m0_72 m0_73 ctrl_1 m1_36 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_37 m0_74 m0_75 ctrl_1 m1_37 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_38 m0_76 m0_77 ctrl_1 m1_38 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_39 m0_78 m0_79 ctrl_1 m1_39 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_40 m0_80 m0_81 ctrl_1 m1_40 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_41 m0_82 m0_83 ctrl_1 m1_41 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_42 m0_84 m0_85 ctrl_1 m1_42 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_43 m0_86 m0_87 ctrl_1 m1_43 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_44 m0_88 m0_89 ctrl_1 m1_44 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_45 m0_90 m0_91 ctrl_1 m1_45 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_46 m0_92 m0_93 ctrl_1 m1_46 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_47 m0_94 m0_95 ctrl_1 m1_47 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_48 m0_96 m0_97 ctrl_1 m1_48 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_49 m0_98 m0_99 ctrl_1 m1_49 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_50 m0_100 m0_101 ctrl_1 m1_50 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_51 m0_102 m0_103 ctrl_1 m1_51 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_52 m0_104 m0_105 ctrl_1 m1_52 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_53 m0_106 m0_107 ctrl_1 m1_53 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_54 m0_108 m0_109 ctrl_1 m1_54 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_55 m0_110 m0_111 ctrl_1 m1_55 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_56 m0_112 m0_113 ctrl_1 m1_56 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_57 m0_114 m0_115 ctrl_1 m1_57 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_58 m0_116 m0_117 ctrl_1 m1_58 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_59 m0_118 m0_119 ctrl_1 m1_59 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_60 m0_120 m0_121 ctrl_1 m1_60 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_61 m0_122 m0_123 ctrl_1 m1_61 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_62 m0_124 m0_125 ctrl_1 m1_62 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_1_63 m0_126 m0_127 ctrl_1 m1_63 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Level 2: select on ctrl_2
x_mux_2_0 m1_0 m1_1 ctrl_2 m2_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_1 m1_2 m1_3 ctrl_2 m2_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_2 m1_4 m1_5 ctrl_2 m2_2 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_3 m1_6 m1_7 ctrl_2 m2_3 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_4 m1_8 m1_9 ctrl_2 m2_4 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_5 m1_10 m1_11 ctrl_2 m2_5 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_6 m1_12 m1_13 ctrl_2 m2_6 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_7 m1_14 m1_15 ctrl_2 m2_7 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_8 m1_16 m1_17 ctrl_2 m2_8 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_9 m1_18 m1_19 ctrl_2 m2_9 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_10 m1_20 m1_21 ctrl_2 m2_10 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_11 m1_22 m1_23 ctrl_2 m2_11 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_12 m1_24 m1_25 ctrl_2 m2_12 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_13 m1_26 m1_27 ctrl_2 m2_13 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_14 m1_28 m1_29 ctrl_2 m2_14 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_15 m1_30 m1_31 ctrl_2 m2_15 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_16 m1_32 m1_33 ctrl_2 m2_16 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_17 m1_34 m1_35 ctrl_2 m2_17 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_18 m1_36 m1_37 ctrl_2 m2_18 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_19 m1_38 m1_39 ctrl_2 m2_19 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_20 m1_40 m1_41 ctrl_2 m2_20 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_21 m1_42 m1_43 ctrl_2 m2_21 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_22 m1_44 m1_45 ctrl_2 m2_22 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_23 m1_46 m1_47 ctrl_2 m2_23 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_24 m1_48 m1_49 ctrl_2 m2_24 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_25 m1_50 m1_51 ctrl_2 m2_25 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_26 m1_52 m1_53 ctrl_2 m2_26 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_27 m1_54 m1_55 ctrl_2 m2_27 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_28 m1_56 m1_57 ctrl_2 m2_28 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_29 m1_58 m1_59 ctrl_2 m2_29 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_30 m1_60 m1_61 ctrl_2 m2_30 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_2_31 m1_62 m1_63 ctrl_2 m2_31 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Level 3: select on ctrl_3
x_mux_3_0 m2_0 m2_1 ctrl_3 m3_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_1 m2_2 m2_3 ctrl_3 m3_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_2 m2_4 m2_5 ctrl_3 m3_2 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_3 m2_6 m2_7 ctrl_3 m3_3 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_4 m2_8 m2_9 ctrl_3 m3_4 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_5 m2_10 m2_11 ctrl_3 m3_5 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_6 m2_12 m2_13 ctrl_3 m3_6 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_7 m2_14 m2_15 ctrl_3 m3_7 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_8 m2_16 m2_17 ctrl_3 m3_8 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_9 m2_18 m2_19 ctrl_3 m3_9 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_10 m2_20 m2_21 ctrl_3 m3_10 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_11 m2_22 m2_23 ctrl_3 m3_11 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_12 m2_24 m2_25 ctrl_3 m3_12 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_13 m2_26 m2_27 ctrl_3 m3_13 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_14 m2_28 m2_29 ctrl_3 m3_14 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_3_15 m2_30 m2_31 ctrl_3 m3_15 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Level 4: select on ctrl_4
x_mux_4_0 m3_0 m3_1 ctrl_4 m4_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_4_1 m3_2 m3_3 ctrl_4 m4_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_4_2 m3_4 m3_5 ctrl_4 m4_2 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_4_3 m3_6 m3_7 ctrl_4 m4_3 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_4_4 m3_8 m3_9 ctrl_4 m4_4 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_4_5 m3_10 m3_11 ctrl_4 m4_5 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_4_6 m3_12 m3_13 ctrl_4 m4_6 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_4_7 m3_14 m3_15 ctrl_4 m4_7 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Level 5: select on ctrl_5
x_mux_5_0 m4_0 m4_1 ctrl_5 m5_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_5_1 m4_2 m4_3 ctrl_5 m5_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_5_2 m4_4 m4_5 ctrl_5 m5_2 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_5_3 m4_6 m4_7 ctrl_5 m5_3 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Level 6: select on ctrl_6
x_mux_6_0 m5_0 m5_1 ctrl_6 m6_0 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1
x_mux_6_1 m5_2 m5_3 ctrl_6 m6_1 vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Level 7: select on ctrl_7
x_mux_7_0 m6_0 m6_1 ctrl_7 fb vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__mux2_1

* Output: clk_out = buffered ring_0
x_outbuf ring_0 clk_out vdd vdd vss vss gf180mcu_fd_sc_mcu7t5v0__inv_1

.ends ring_dco
