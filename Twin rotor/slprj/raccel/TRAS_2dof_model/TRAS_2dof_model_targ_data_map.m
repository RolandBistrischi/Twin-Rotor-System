    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 2;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 132;
            section.data(132)  = dumData; %prealloc

                    ;% rtP.control_a
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.control_p
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 81;

                    ;% rtP.force_a
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 162;

                    ;% rtP.force_p
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 243;

                    ;% rtP.rpm_a
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 324;

                    ;% rtP.rpm_p
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 405;

                    ;% rtP.PIDH11_D
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 486;

                    ;% rtP.PIDH22_D
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 487;

                    ;% rtP.PIDH11_I
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 488;

                    ;% rtP.PIDH22_I
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 489;

                    ;% rtP.PIDH11_InitialConditionForFilter
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 490;

                    ;% rtP.PIDH22_InitialConditionForFilter
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 491;

                    ;% rtP.PIDH11_InitialConditionForIntegrator
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 492;

                    ;% rtP.PIDH22_InitialConditionForIntegrator
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 493;

                    ;% rtP.FractionalPIDcontroller1_Kd
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 494;

                    ;% rtP.FractionalPIDcontroller2_Kd
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 495;

                    ;% rtP.FractionalPIDcontroller_Kd
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 496;

                    ;% rtP.FractionalPIDcontroller1_Kd_cktyldyb5v
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 497;

                    ;% rtP.FractionalPIDcontroller2_Kd_adfdsts2cz
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 498;

                    ;% rtP.FractionalPIDcontroller1_Ki
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 499;

                    ;% rtP.FractionalPIDcontroller2_Ki
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 500;

                    ;% rtP.FractionalPIDcontroller_Ki
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 501;

                    ;% rtP.FractionalPIDcontroller1_Ki_fcgp0ssxe2
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 502;

                    ;% rtP.FractionalPIDcontroller2_Ki_kjwg1dqtj5
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 503;

                    ;% rtP.PIDH11_N
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 504;

                    ;% rtP.PIDH22_N
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 505;

                    ;% rtP.PIDH11_P
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 506;

                    ;% rtP.PIDH22_P
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 507;

                    ;% rtP.Integrator1_IC
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 508;

                    ;% rtP.uJa_Gain
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 509;

                    ;% rtP.iv3_IC
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 510;

                    ;% rtP.iv3_UpperSat
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 511;

                    ;% rtP.iv3_LowerSat
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 512;

                    ;% rtP.Integrator_IC
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 513;

                    ;% rtP.uJp1_Gain
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 514;

                    ;% rtP.Step11_Time
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 515;

                    ;% rtP.Step11_Y0
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 516;

                    ;% rtP.Step11_YFinal
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 517;

                    ;% rtP.D21_A
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 518;

                    ;% rtP.D21_C
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 519;

                    ;% rtP.D21_D
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 520;

                    ;% rtP.Step12_Time
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 521;

                    ;% rtP.Step12_Y0
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 522;

                    ;% rtP.Step12_YFinal
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 523;

                    ;% rtP.AzimuthH22_Gain
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 524;

                    ;% rtP.iv1_IC
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 525;

                    ;% rtP.iv1_UpperSat
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 526;

                    ;% rtP.iv1_LowerSat
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 527;

                    ;% rtP.D12_A
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 528;

                    ;% rtP.D12_C
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 529;

                    ;% rtP.D12_D
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 530;

                    ;% rtP.PitchH11_Gain
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 531;

                    ;% rtP.R_A1_Gain
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 532;

                    ;% rtP.ih_IC
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 533;

                    ;% rtP.R_A2_Gain
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 534;

                    ;% rtP.R_A_Gain
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 535;

                    ;% rtP.Gain3_Gain
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 536;

                    ;% rtP.m3_Gain
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 537;

                    ;% rtP.Gain1_Gain
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 538;

                    ;% rtP.m2_Gain
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 539;

                    ;% rtP.iv2_IC
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 540;

                    ;% rtP.m7_Gain
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 541;

                    ;% rtP.m1_Gain
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 542;

                    ;% rtP.R_P_Gain
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 543;

                    ;% rtP.m6_Gain
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 544;

                    ;% rtP.Internal_A_pr
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 545;

                    ;% rtP.Internal_B_pr
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 546;

                    ;% rtP.Internal_C_pr
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 547;

                    ;% rtP.Internal_D_pr
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 548;

                    ;% rtP.Internal_InitialCondition
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 549;

                    ;% rtP.TransferFcn1_A
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 550;

                    ;% rtP.TransferFcn1_C
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 551;

                    ;% rtP.Internal_A_pr_oyjjirm1kx
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 552;

                    ;% rtP.Internal_B_pr_au0fet3yzl
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 618;

                    ;% rtP.Internal_C_pr_enpotgrtpz
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 629;

                    ;% rtP.Internal_D_pr_cbnbxjghfm
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 640;

                    ;% rtP.Internal_InitialCondition_gkuj4oapel
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 641;

                    ;% rtP.TransferFcn1_A_jvoyunirms
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 642;

                    ;% rtP.TransferFcn1_C_p1qztopeoo
                    section.data(79).logicalSrcIdx = 78;
                    section.data(79).dtTransOffset = 643;

                    ;% rtP.Internal_D_pr_ftkigkd45s
                    section.data(80).logicalSrcIdx = 79;
                    section.data(80).dtTransOffset = 644;

                    ;% rtP.Internal_InitialCondition_gtzyyjaguu
                    section.data(81).logicalSrcIdx = 80;
                    section.data(81).dtTransOffset = 645;

                    ;% rtP.TransferFcn1_A_jvo420osds
                    section.data(82).logicalSrcIdx = 81;
                    section.data(82).dtTransOffset = 646;

                    ;% rtP.TransferFcn1_C_pa1znp5ici
                    section.data(83).logicalSrcIdx = 82;
                    section.data(83).dtTransOffset = 647;

                    ;% rtP.Internal_B_pr_fwnutaqvgl
                    section.data(84).logicalSrcIdx = 83;
                    section.data(84).dtTransOffset = 648;

                    ;% rtP.Internal_C_pr_n03rjhdezu
                    section.data(85).logicalSrcIdx = 84;
                    section.data(85).dtTransOffset = 649;

                    ;% rtP.Internal_InitialCondition_omefaxkung
                    section.data(86).logicalSrcIdx = 85;
                    section.data(86).dtTransOffset = 650;

                    ;% rtP.TransferFcn1_A_eawc3pddjy
                    section.data(87).logicalSrcIdx = 86;
                    section.data(87).dtTransOffset = 651;

                    ;% rtP.TransferFcn1_C_kwqvw5jbah
                    section.data(88).logicalSrcIdx = 87;
                    section.data(88).dtTransOffset = 652;

                    ;% rtP.Internal_A_pr_mwq41kchyr
                    section.data(89).logicalSrcIdx = 88;
                    section.data(89).dtTransOffset = 653;

                    ;% rtP.Internal_B_pr_ablmqrrv5r
                    section.data(90).logicalSrcIdx = 89;
                    section.data(90).dtTransOffset = 719;

                    ;% rtP.Internal_C_pr_l1ivnrijnm
                    section.data(91).logicalSrcIdx = 90;
                    section.data(91).dtTransOffset = 730;

                    ;% rtP.Internal_D_pr_aaq4ww0rsb
                    section.data(92).logicalSrcIdx = 91;
                    section.data(92).dtTransOffset = 741;

                    ;% rtP.Internal_InitialCondition_n5v5kawmah
                    section.data(93).logicalSrcIdx = 92;
                    section.data(93).dtTransOffset = 742;

                    ;% rtP.TransferFcn1_A_ae4vnndsdi
                    section.data(94).logicalSrcIdx = 93;
                    section.data(94).dtTransOffset = 743;

                    ;% rtP.TransferFcn1_C_dufn3b2avs
                    section.data(95).logicalSrcIdx = 94;
                    section.data(95).dtTransOffset = 744;

                    ;% rtP.Internal_D_pr_p02i25wy0b
                    section.data(96).logicalSrcIdx = 95;
                    section.data(96).dtTransOffset = 745;

                    ;% rtP.Internal_InitialCondition_m0lfmfz0iu
                    section.data(97).logicalSrcIdx = 96;
                    section.data(97).dtTransOffset = 746;

                    ;% rtP.TransferFcn1_A_kuxz443wdc
                    section.data(98).logicalSrcIdx = 97;
                    section.data(98).dtTransOffset = 747;

                    ;% rtP.TransferFcn1_C_myrb2vgz0p
                    section.data(99).logicalSrcIdx = 98;
                    section.data(99).dtTransOffset = 748;

                    ;% rtP.Internal_D_pr_ilyqvmletq
                    section.data(100).logicalSrcIdx = 99;
                    section.data(100).dtTransOffset = 749;

                    ;% rtP.Internal_InitialCondition_c1yrfy3gzu
                    section.data(101).logicalSrcIdx = 100;
                    section.data(101).dtTransOffset = 750;

                    ;% rtP.TransferFcn1_A_ioqoub3d3t
                    section.data(102).logicalSrcIdx = 101;
                    section.data(102).dtTransOffset = 751;

                    ;% rtP.TransferFcn1_C_dcpqblfb10
                    section.data(103).logicalSrcIdx = 102;
                    section.data(103).dtTransOffset = 752;

                    ;% rtP.Internal_B_pr_oeuh3vjlwu
                    section.data(104).logicalSrcIdx = 103;
                    section.data(104).dtTransOffset = 753;

                    ;% rtP.Internal_C_pr_eie2kt4des
                    section.data(105).logicalSrcIdx = 104;
                    section.data(105).dtTransOffset = 754;

                    ;% rtP.Internal_InitialCondition_j1fjpgtl3n
                    section.data(106).logicalSrcIdx = 105;
                    section.data(106).dtTransOffset = 755;

                    ;% rtP.TransferFcn1_A_jqrwj4rpz1
                    section.data(107).logicalSrcIdx = 106;
                    section.data(107).dtTransOffset = 756;

                    ;% rtP.TransferFcn1_C_hgyeuf33te
                    section.data(108).logicalSrcIdx = 107;
                    section.data(108).dtTransOffset = 757;

                    ;% rtP.Internal_D_pr_howwo5ykxk
                    section.data(109).logicalSrcIdx = 108;
                    section.data(109).dtTransOffset = 758;

                    ;% rtP.Internal_InitialCondition_npozeerkwd
                    section.data(110).logicalSrcIdx = 109;
                    section.data(110).dtTransOffset = 759;

                    ;% rtP.TransferFcn1_A_gwfeakisgo
                    section.data(111).logicalSrcIdx = 110;
                    section.data(111).dtTransOffset = 760;

                    ;% rtP.TransferFcn1_C_ha4knw45mi
                    section.data(112).logicalSrcIdx = 111;
                    section.data(112).dtTransOffset = 761;

                    ;% rtP.Internal_B_pr_kmyvpbbyrv
                    section.data(113).logicalSrcIdx = 112;
                    section.data(113).dtTransOffset = 762;

                    ;% rtP.Internal_C_pr_nb42sbyzoo
                    section.data(114).logicalSrcIdx = 113;
                    section.data(114).dtTransOffset = 763;

                    ;% rtP.Internal_InitialCondition_ba1cnq4dlp
                    section.data(115).logicalSrcIdx = 114;
                    section.data(115).dtTransOffset = 764;

                    ;% rtP.TransferFcn1_A_gnicpt3yph
                    section.data(116).logicalSrcIdx = 115;
                    section.data(116).dtTransOffset = 765;

                    ;% rtP.TransferFcn1_C_kwn2svax3p
                    section.data(117).logicalSrcIdx = 116;
                    section.data(117).dtTransOffset = 766;

                    ;% rtP.Step1_Time
                    section.data(118).logicalSrcIdx = 117;
                    section.data(118).dtTransOffset = 767;

                    ;% rtP.Step1_Y0
                    section.data(119).logicalSrcIdx = 118;
                    section.data(119).dtTransOffset = 768;

                    ;% rtP.Step1_YFinal
                    section.data(120).logicalSrcIdx = 119;
                    section.data(120).dtTransOffset = 769;

                    ;% rtP.Step3_Time
                    section.data(121).logicalSrcIdx = 120;
                    section.data(121).dtTransOffset = 770;

                    ;% rtP.Step3_Y0
                    section.data(122).logicalSrcIdx = 121;
                    section.data(122).dtTransOffset = 771;

                    ;% rtP.Step3_YFinal
                    section.data(123).logicalSrcIdx = 122;
                    section.data(123).dtTransOffset = 772;

                    ;% rtP.Step4_Time
                    section.data(124).logicalSrcIdx = 123;
                    section.data(124).dtTransOffset = 773;

                    ;% rtP.Step4_Y0
                    section.data(125).logicalSrcIdx = 124;
                    section.data(125).dtTransOffset = 774;

                    ;% rtP.Step4_YFinal
                    section.data(126).logicalSrcIdx = 125;
                    section.data(126).dtTransOffset = 775;

                    ;% rtP.Step5_Time
                    section.data(127).logicalSrcIdx = 126;
                    section.data(127).dtTransOffset = 776;

                    ;% rtP.Step5_Y0
                    section.data(128).logicalSrcIdx = 127;
                    section.data(128).dtTransOffset = 777;

                    ;% rtP.Step5_YFinal
                    section.data(129).logicalSrcIdx = 128;
                    section.data(129).dtTransOffset = 778;

                    ;% rtP.Step6_Time
                    section.data(130).logicalSrcIdx = 129;
                    section.data(130).dtTransOffset = 779;

                    ;% rtP.Step6_Y0
                    section.data(131).logicalSrcIdx = 130;
                    section.data(131).dtTransOffset = 780;

                    ;% rtP.Step6_YFinal
                    section.data(132).logicalSrcIdx = 131;
                    section.data(132).dtTransOffset = 781;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 44;
            section.data(44)  = dumData; %prealloc

                    ;% rtP.Internal_A_ir
                    section.data(1).logicalSrcIdx = 132;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.Internal_A_jc
                    section.data(2).logicalSrcIdx = 133;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.Internal_B_ir
                    section.data(3).logicalSrcIdx = 134;
                    section.data(3).dtTransOffset = 3;

                    ;% rtP.Internal_B_jc
                    section.data(4).logicalSrcIdx = 135;
                    section.data(4).dtTransOffset = 4;

                    ;% rtP.Internal_C_ir
                    section.data(5).logicalSrcIdx = 136;
                    section.data(5).dtTransOffset = 6;

                    ;% rtP.Internal_C_jc
                    section.data(6).logicalSrcIdx = 137;
                    section.data(6).dtTransOffset = 7;

                    ;% rtP.Internal_D_ir
                    section.data(7).logicalSrcIdx = 138;
                    section.data(7).dtTransOffset = 9;

                    ;% rtP.Internal_D_jc
                    section.data(8).logicalSrcIdx = 139;
                    section.data(8).dtTransOffset = 10;

                    ;% rtP.Internal_A_ir_lt0mujnoco
                    section.data(9).logicalSrcIdx = 140;
                    section.data(9).dtTransOffset = 12;

                    ;% rtP.Internal_A_jc_mhpguuqiql
                    section.data(10).logicalSrcIdx = 141;
                    section.data(10).dtTransOffset = 78;

                    ;% rtP.Internal_B_ir_kknoqxu3xf
                    section.data(11).logicalSrcIdx = 142;
                    section.data(11).dtTransOffset = 90;

                    ;% rtP.Internal_B_jc_di4ygjrrxp
                    section.data(12).logicalSrcIdx = 143;
                    section.data(12).dtTransOffset = 101;

                    ;% rtP.Internal_C_ir_bpvpjyhh50
                    section.data(13).logicalSrcIdx = 144;
                    section.data(13).dtTransOffset = 103;

                    ;% rtP.Internal_C_jc_nfs5nawamg
                    section.data(14).logicalSrcIdx = 145;
                    section.data(14).dtTransOffset = 114;

                    ;% rtP.Internal_D_ir_nimtudfqvy
                    section.data(15).logicalSrcIdx = 146;
                    section.data(15).dtTransOffset = 126;

                    ;% rtP.Internal_D_jc_njabwzxsbu
                    section.data(16).logicalSrcIdx = 147;
                    section.data(16).dtTransOffset = 127;

                    ;% rtP.Internal_D_ir_c1n1ecqg5e
                    section.data(17).logicalSrcIdx = 148;
                    section.data(17).dtTransOffset = 129;

                    ;% rtP.Internal_D_jc_msslbhppgh
                    section.data(18).logicalSrcIdx = 149;
                    section.data(18).dtTransOffset = 130;

                    ;% rtP.Internal_B_ir_e5q2ielz0k
                    section.data(19).logicalSrcIdx = 150;
                    section.data(19).dtTransOffset = 132;

                    ;% rtP.Internal_B_jc_b5uitas21k
                    section.data(20).logicalSrcIdx = 151;
                    section.data(20).dtTransOffset = 133;

                    ;% rtP.Internal_C_ir_dj54yvrj3y
                    section.data(21).logicalSrcIdx = 152;
                    section.data(21).dtTransOffset = 135;

                    ;% rtP.Internal_C_jc_atzel0anhk
                    section.data(22).logicalSrcIdx = 153;
                    section.data(22).dtTransOffset = 136;

                    ;% rtP.Internal_A_ir_k3rmsjspu3
                    section.data(23).logicalSrcIdx = 154;
                    section.data(23).dtTransOffset = 138;

                    ;% rtP.Internal_A_jc_ico2ix4g3r
                    section.data(24).logicalSrcIdx = 155;
                    section.data(24).dtTransOffset = 204;

                    ;% rtP.Internal_B_ir_kgt0n55ea0
                    section.data(25).logicalSrcIdx = 156;
                    section.data(25).dtTransOffset = 216;

                    ;% rtP.Internal_B_jc_ncvbnp5zed
                    section.data(26).logicalSrcIdx = 157;
                    section.data(26).dtTransOffset = 227;

                    ;% rtP.Internal_C_ir_cjnkvshnhd
                    section.data(27).logicalSrcIdx = 158;
                    section.data(27).dtTransOffset = 229;

                    ;% rtP.Internal_C_jc_idimqapynj
                    section.data(28).logicalSrcIdx = 159;
                    section.data(28).dtTransOffset = 240;

                    ;% rtP.Internal_D_ir_cvjj3ujewj
                    section.data(29).logicalSrcIdx = 160;
                    section.data(29).dtTransOffset = 252;

                    ;% rtP.Internal_D_jc_gvthc55kni
                    section.data(30).logicalSrcIdx = 161;
                    section.data(30).dtTransOffset = 253;

                    ;% rtP.Internal_D_ir_prlosd5dyu
                    section.data(31).logicalSrcIdx = 162;
                    section.data(31).dtTransOffset = 255;

                    ;% rtP.Internal_D_jc_m2cl305t1t
                    section.data(32).logicalSrcIdx = 163;
                    section.data(32).dtTransOffset = 256;

                    ;% rtP.Internal_D_ir_ohygarzx4s
                    section.data(33).logicalSrcIdx = 164;
                    section.data(33).dtTransOffset = 258;

                    ;% rtP.Internal_D_jc_b3x1llq0ff
                    section.data(34).logicalSrcIdx = 165;
                    section.data(34).dtTransOffset = 259;

                    ;% rtP.Internal_B_ir_opjqujg5gf
                    section.data(35).logicalSrcIdx = 166;
                    section.data(35).dtTransOffset = 261;

                    ;% rtP.Internal_B_jc_o3szusvxkw
                    section.data(36).logicalSrcIdx = 167;
                    section.data(36).dtTransOffset = 262;

                    ;% rtP.Internal_C_ir_jqy55xbh3j
                    section.data(37).logicalSrcIdx = 168;
                    section.data(37).dtTransOffset = 264;

                    ;% rtP.Internal_C_jc_gcbznjcfuo
                    section.data(38).logicalSrcIdx = 169;
                    section.data(38).dtTransOffset = 265;

                    ;% rtP.Internal_D_ir_mvufke4m5s
                    section.data(39).logicalSrcIdx = 170;
                    section.data(39).dtTransOffset = 267;

                    ;% rtP.Internal_D_jc_kderkjhrwv
                    section.data(40).logicalSrcIdx = 171;
                    section.data(40).dtTransOffset = 268;

                    ;% rtP.Internal_B_ir_oegikg3rp3
                    section.data(41).logicalSrcIdx = 172;
                    section.data(41).dtTransOffset = 270;

                    ;% rtP.Internal_B_jc_cjygwe2rdv
                    section.data(42).logicalSrcIdx = 173;
                    section.data(42).dtTransOffset = 271;

                    ;% rtP.Internal_C_ir_lma0c15mon
                    section.data(43).logicalSrcIdx = 174;
                    section.data(43).dtTransOffset = 273;

                    ;% rtP.Internal_C_jc_aa5fiqedwy
                    section.data(44).logicalSrcIdx = 175;
                    section.data(44).dtTransOffset = 274;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%
            section.nData     = 78;
            section.data(78)  = dumData; %prealloc

                    ;% rtB.erbrcq20ws
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.e2qxpult0l
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.fet3qizh0j
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtB.by5ff02b5y
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtB.kt41jradvt
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtB.aqs4oxuwyl
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtB.cd4wpzwctw
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtB.oxflnbwtba
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtB.jm4vpunmvn
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtB.hkxcz5n3u4
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% rtB.fboo2yk1af
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% rtB.musqjdo1j0
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% rtB.lqggrcs4ug
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% rtB.mkzdlh0qin
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 13;

                    ;% rtB.demaor1dik
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 14;

                    ;% rtB.erpxqhxk00
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 15;

                    ;% rtB.c5kx2oh2se
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 16;

                    ;% rtB.offfk3higa
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 17;

                    ;% rtB.cmmyyeec03
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 18;

                    ;% rtB.iwxxthzuqe
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 19;

                    ;% rtB.dmvry52sf0
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 20;

                    ;% rtB.ouiqsk0vmf
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 21;

                    ;% rtB.puxd3yedqm
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 22;

                    ;% rtB.ftgxcyqkjl
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 23;

                    ;% rtB.mot5vgcutr
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 24;

                    ;% rtB.ldhi2fpbxl
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 25;

                    ;% rtB.krxu1qmwom
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 26;

                    ;% rtB.hsrvh1wvsr
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 27;

                    ;% rtB.bouweblsab
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 28;

                    ;% rtB.irz4j1sojy
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 29;

                    ;% rtB.mxr3hlwucz
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 30;

                    ;% rtB.gajroozbt2
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 31;

                    ;% rtB.nnyvg3ewi2
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 32;

                    ;% rtB.fphc0a1yof
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 33;

                    ;% rtB.lmvs3x222n
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 34;

                    ;% rtB.jvxhhdzj44
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 35;

                    ;% rtB.lyilqbdoth
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 36;

                    ;% rtB.oi4rz33jw2
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 37;

                    ;% rtB.d2iamzdwvx
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 38;

                    ;% rtB.mnoyv4c1oi
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 39;

                    ;% rtB.o0tumhunrv
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 40;

                    ;% rtB.eubeamzge2
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 41;

                    ;% rtB.dzp5kslu0y
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 42;

                    ;% rtB.mznss5gtji
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 43;

                    ;% rtB.a2xogmmrwy
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 44;

                    ;% rtB.pdb2nsllfb
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 45;

                    ;% rtB.jmkmxy13ke
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 46;

                    ;% rtB.hffy2x0mio
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 47;

                    ;% rtB.pqw0bmbvyh
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 48;

                    ;% rtB.ne0icjjiea
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 49;

                    ;% rtB.bwqaarfcvc
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 50;

                    ;% rtB.giyyztgrks
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 51;

                    ;% rtB.k4zikws1lv
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 52;

                    ;% rtB.dyebmkbotq
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 53;

                    ;% rtB.jsze1vkano
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 54;

                    ;% rtB.fek5cpgpxc
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 55;

                    ;% rtB.jex533xe4y
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 56;

                    ;% rtB.mjovcv0cli
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 57;

                    ;% rtB.ezwu5kevjn
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 58;

                    ;% rtB.n4oygy2keq
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 59;

                    ;% rtB.blj1vvf5bz
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 60;

                    ;% rtB.gz52pym3ld
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 61;

                    ;% rtB.dn1kv0lvn1
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 62;

                    ;% rtB.gpw5rttvyx
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 63;

                    ;% rtB.ctrfw1tj5m
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 64;

                    ;% rtB.ml0fw5n3jm
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 65;

                    ;% rtB.dabmhed4kp
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 66;

                    ;% rtB.ixdslxr1wi
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 67;

                    ;% rtB.nda511k3pz
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 68;

                    ;% rtB.kqlvxbvvpq
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 69;

                    ;% rtB.mogw3m3ole
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 70;

                    ;% rtB.hjkoaew1qn
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 71;

                    ;% rtB.m0yxj5xmvn
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 72;

                    ;% rtB.n4gzkqwnjl
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 73;

                    ;% rtB.jicgqcymkr
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 74;

                    ;% rtB.enxktml03x
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 75;

                    ;% rtB.pju2nswxhr
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 76;

                    ;% rtB.ldvf4d0xaa
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 77;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 2;
        sectIdxOffset = 1;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtDW.di3vciqhvk.LoggedData
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.l5agenf1h4.LoggedData
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 3;

                    ;% rtDW.jxva0kkoia.LoggedData
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 6;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 11;
            section.data(11)  = dumData; %prealloc

                    ;% rtDW.pn4vsggslw
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.mu4n3ns15f
                    section.data(2).logicalSrcIdx = 4;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.elxrpmovlm
                    section.data(3).logicalSrcIdx = 5;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.invv4ejzdr
                    section.data(4).logicalSrcIdx = 6;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.ohuy4ui33e
                    section.data(5).logicalSrcIdx = 7;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.ngukhbswzj
                    section.data(6).logicalSrcIdx = 8;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.d4cvoix4ms
                    section.data(7).logicalSrcIdx = 9;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.cw1ttcuebj
                    section.data(8).logicalSrcIdx = 10;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.kgwf2z5yp1
                    section.data(9).logicalSrcIdx = 11;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.nq14rtfxrv
                    section.data(10).logicalSrcIdx = 12;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.nvpqsiifnq
                    section.data(11).logicalSrcIdx = 13;
                    section.data(11).dtTransOffset = 10;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 2406384959;
    targMap.checksum1 = 3323145849;
    targMap.checksum2 = 1788149093;
    targMap.checksum3 = 2002023803;

