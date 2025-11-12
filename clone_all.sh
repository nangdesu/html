#!/bin/bash
mkdir -p assets
cd assets

echo '=== Cloning all required repositories ==='
if [ ! -d "234sd4w5w45wers5tr-645758574456456_435345345346" ]; then
  echo "Cloning branch main from 234sd4w5w45wers5tr-645758574456456/435345345346..."
  git clone --depth 1 --branch main https://github.com/234sd4w5w45wers5tr-645758574456456/435345345346.git 234sd4w5w45wers5tr-645758574456456_435345345346
fi

if [ ! -d "3kh0_3kh0-lite" ]; then
  echo "Cloning commit d5cf6bb79a6427ada99e7f2e31425325f454565d from 3kh0/3kh0-lite..."
  git clone https://github.com/3kh0/3kh0-lite.git 3kh0_3kh0-lite && cd 3kh0_3kh0-lite && git checkout d5cf6bb79a6427ada99e7f2e31425325f454565d && cd ..
fi

if [ ! -d "Abdess_retroarch_system" ]; then
  echo "Cloning commit 5f96368f6dbad5851cdb16a5041fefec4bdcd305 from Abdess/retroarch_system..."
  git clone https://github.com/Abdess/retroarch_system.git Abdess_retroarch_system && cd Abdess_retroarch_system && git checkout 5f96368f6dbad5851cdb16a5041fefec4bdcd305 && cd ..
fi

if [ ! -d "AlgebraHelper_AlgebraHelper" ]; then
  echo "Cloning commit 8e5a5b1d2b14aaf641c716af947c57609f52cf55 from AlgebraHelper/AlgebraHelper..."
  git clone https://github.com/AlgebraHelper/AlgebraHelper.git AlgebraHelper_AlgebraHelper && cd AlgebraHelper_AlgebraHelper && git checkout 8e5a5b1d2b14aaf641c716af947c57609f52cf55 && cd ..
fi

if [ ! -d "AndreajnRcm4_b398dl2h74v" ]; then
  echo "Cloning commit 9a23fbb2373d743a564873251cbb57736ebc1f73 from AndreajnRcm4/b398dl2h74v..."
  git clone https://github.com/AndreajnRcm4/b398dl2h74v.git AndreajnRcm4_b398dl2h74v && cd AndreajnRcm4_b398dl2h74v && git checkout 9a23fbb2373d743a564873251cbb57736ebc1f73 && cd ..
fi

if [ ! -d "ArkShocer_sm64" ]; then
  echo "Cloning branch main from ArkShocer/sm64..."
  git clone --depth 1 --branch main https://github.com/ArkShocer/sm64.git ArkShocer_sm64
fi

if [ ! -d "Aydeniguess_Collegegrounds" ]; then
  echo "Cloning commit 5ecd84f45d20a5f5f2f5e708d8c8da132be8751c from Aydeniguess/Collegegrounds..."
  git clone https://github.com/Aydeniguess/Collegegrounds.git Aydeniguess_Collegegrounds && cd Aydeniguess_Collegegrounds && git checkout 5ecd84f45d20a5f5f2f5e708d8c8da132be8751c && cd ..
fi

if [ ! -d "Bescr01_swf" ]; then
  echo "Cloning commit e2ab9deab96c02aaa67e56334d34ccea3bbb8a3e from Bescr01/swf..."
  git clone https://github.com/Bescr01/swf.git Bescr01_swf && cd Bescr01_swf && git checkout e2ab9deab96c02aaa67e56334d34ccea3bbb8a3e && cd ..
fi

if [ ! -d "BinBashBanana_gstore" ]; then
  echo "Cloning branch master from BinBashBanana/gstore..."
  git clone --depth 1 --branch master https://github.com/BinBashBanana/gstore.git BinBashBanana_gstore
fi

if [ ! -d "Bored-Entertainment_themesacomplex" ]; then
  echo "Cloning commit 34cdabf38057531877474cfdcdd03f05e40a9453 from Bored-Entertainment/themesacomplex..."
  git clone https://github.com/Bored-Entertainment/themesacomplex.git Bored-Entertainment_themesacomplex && cd Bored-Entertainment_themesacomplex && git checkout 34cdabf38057531877474cfdcdd03f05e40a9453 && cd ..
fi

if [ ! -d "Buss-beep-3_Omygayyatta" ]; then
  echo "Cloning commit 13ed2774c457b7e829d7d73be624e3c3a6f2b884 from Buss-beep-3/Omygayyatta..."
  git clone https://github.com/Buss-beep-3/Omygayyatta.git Buss-beep-3_Omygayyatta && cd Buss-beep-3_Omygayyatta && git checkout 13ed2774c457b7e829d7d73be624e3c3a6f2b884 && cd ..
fi

if [ ! -d "D3ch_hell" ]; then
  echo "Cloning commit 0f5fb93e38b479f6354653ba85aa4f5a3c312379 from D3ch/hell..."
  git clone https://github.com/D3ch/hell.git D3ch_hell && cd D3ch_hell && git checkout 0f5fb93e38b479f6354653ba85aa4f5a3c312379 && cd ..
fi

if [ ! -d "Edward358-AI_HTML5-games" ]; then
  echo "Cloning commit 3c35856e44aea5d93ebe781cb1af84570dd8512c from Edward358-AI/HTML5-games..."
  git clone https://github.com/Edward358-AI/HTML5-games.git Edward358-AI_HTML5-games && cd Edward358-AI_HTML5-games && git checkout 3c35856e44aea5d93ebe781cb1af84570dd8512c && cd ..
fi

if [ ! -d "Gzh0821_pvzge_web" ]; then
  echo "Cloning branch master from Gzh0821/pvzge_web..."
  git clone --depth 1 --branch master https://github.com/Gzh0821/pvzge_web.git Gzh0821_pvzge_web
fi

if [ ! -d "Jokarcana_Tanuki-Sunset" ]; then
  echo "Cloning commit a5b13b1279016c9bd123f06a4886b5987fa06dc5 from Jokarcana/Tanuki-Sunset..."
  git clone https://github.com/Jokarcana/Tanuki-Sunset.git Jokarcana_Tanuki-Sunset && cd Jokarcana_Tanuki-Sunset && git checkout a5b13b1279016c9bd123f06a4886b5987fa06dc5 && cd ..
fi

if [ ! -d "JoshMerlino_shsg-pfile" ]; then
  echo "Cloning commit 82bf749f1807f294a619dc5c7b686bcdbdc35540 from JoshMerlino/shsg-pfile..."
  git clone https://github.com/JoshMerlino/shsg-pfile.git JoshMerlino_shsg-pfile && cd JoshMerlino_shsg-pfile && git checkout 82bf749f1807f294a619dc5c7b686bcdbdc35540 && cd ..
fi

if [ ! -d "Loddypof_gitapp" ]; then
  echo "Cloning commit 581c119c1d6222694218df114c2da57271ab67e7 from Loddypof/gitapp..."
  git clone https://github.com/Loddypof/gitapp.git Loddypof_gitapp && cd Loddypof_gitapp && git checkout 581c119c1d6222694218df114c2da57271ab67e7 && cd ..
fi

if [ ! -d "LoloNiz_Freezeria" ]; then
  echo "Cloning commit 9a00da26caa0977a3c0d068015611aa87eea5b35 from LoloNiz/Freezeria..."
  git clone https://github.com/LoloNiz/Freezeria.git LoloNiz_Freezeria && cd LoloNiz_Freezeria && git checkout 9a00da26caa0977a3c0d068015611aa87eea5b35 && cd ..
fi

if [ ! -d "LoloNiz_Pizzeria" ]; then
  echo "Cloning commit 25bdd5a9a06bf15786d3299b5a8f29555ca21491 from LoloNiz/Pizzeria..."
  git clone https://github.com/LoloNiz/Pizzeria.git LoloNiz_Pizzeria && cd LoloNiz_Pizzeria && git checkout 25bdd5a9a06bf15786d3299b5a8f29555ca21491 && cd ..
fi

if [ ! -d "Magixxz_embeds" ]; then
  echo "Cloning commit a9ae99acf7e9feb974b973c9331282ae025754ce from Magixxz/embeds..."
  git clone https://github.com/Magixxz/embeds.git Magixxz_embeds && cd Magixxz_embeds && git checkout a9ae99acf7e9feb974b973c9331282ae025754ce && cd ..
fi

if [ ! -d "Mr-milky-way_this-is-the-only-level-2" ]; then
  echo "Cloning commit 2dde7aa109c52cea0eb59d4de44708c2746d262d from Mr-milky-way/this-is-the-only-level-2..."
  git clone https://github.com/Mr-milky-way/this-is-the-only-level-2.git Mr-milky-way_this-is-the-only-level-2 && cd Mr-milky-way_this-is-the-only-level-2 && git checkout 2dde7aa109c52cea0eb59d4de44708c2746d262d && cd ..
fi

if [ ! -d "Nailington_3kh0-assets" ]; then
  echo "Cloning commit aeb371b7e88542fd5e61eeed9e967a446d84fe1b from Nailington/3kh0-assets..."
  git clone https://github.com/Nailington/3kh0-assets.git Nailington_3kh0-assets && cd Nailington_3kh0-assets && git checkout aeb371b7e88542fd5e61eeed9e967a446d84fe1b && cd ..
fi

if [ ! -d "Oozaru341_ClickJogos" ]; then
  echo "Cloning commit a18a27ddb0e3fe3f0c48225a5908607023c90523 from Oozaru341/ClickJogos..."
  git clone https://github.com/Oozaru341/ClickJogos.git Oozaru341_ClickJogos && cd Oozaru341_ClickJogos && git checkout a18a27ddb0e3fe3f0c48225a5908607023c90523 && cd ..
fi

if [ ! -d "OutRed_outredgames" ]; then
  echo "Cloning commit 2fe3381b1dde77159e2205f0127ea8a6647e77a2 from OutRed/outredgames..."
  git clone https://github.com/OutRed/outredgames.git OutRed_outredgames && cd OutRed_outredgames && git checkout 2fe3381b1dde77159e2205f0127ea8a6647e77a2 && cd ..
fi

if [ ! -d "QiProject_flash-games" ]; then
  echo "Cloning commit 8a30ea684498b868a7b1cd188bd860ba2042eb56 from QiProject/flash-games..."
  git clone https://github.com/QiProject/flash-games.git QiProject_flash-games && cd QiProject_flash-games && git checkout 8a30ea684498b868a7b1cd188bd860ba2042eb56 && cd ..
fi

if [ ! -d "Rabbibo_moto" ]; then
  echo "Cloning commit 35b09901c725d990145f7b305cbcb42ddcee4782 from Rabbibo/moto..."
  git clone https://github.com/Rabbibo/moto.git Rabbibo_moto && cd Rabbibo_moto && git checkout 35b09901c725d990145f7b305cbcb42ddcee4782 && cd ..
fi

if [ ! -d "Sharon-Eva_home" ]; then
  echo "Cloning commit 0e6a3e7b393557c56f318855343173b63eac8c21 from Sharon-Eva/home..."
  git clone https://github.com/Sharon-Eva/home.git Sharon-Eva_home && cd Sharon-Eva_home && git checkout 0e6a3e7b393557c56f318855343173b63eac8c21 && cd ..
fi

if [ ! -d "StarRepo444_ClassroomPlayV2" ]; then
  echo "Cloning commit c28ef0cfdccbbfc61a42d9954f14af3115c7398a from StarRepo444/ClassroomPlayV2..."
  git clone https://github.com/StarRepo444/ClassroomPlayV2.git StarRepo444_ClassroomPlayV2 && cd StarRepo444_ClassroomPlayV2 && git checkout c28ef0cfdccbbfc61a42d9954f14af3115c7398a && cd ..
fi

if [ ! -d "Stinkalistic_Flash-games" ]; then
  echo "Cloning branch refs from Stinkalistic/Flash-games..."
  git clone --depth 1 --branch refs https://github.com/Stinkalistic/Flash-games.git Stinkalistic_Flash-games
fi

if [ ! -d "Stinkalistic_UGS" ]; then
  echo "Cloning branch main from Stinkalistic/UGS..."
  git clone --depth 1 --branch main https://github.com/Stinkalistic/UGS.git Stinkalistic_UGS
fi

if [ ! -d "Stypical_lacklack" ]; then
  echo "Cloning commit 0959ed15fc96078cbb053e4e3c259a62b3e9e296 from Stypical/lacklack..."
  git clone https://github.com/Stypical/lacklack.git Stypical_lacklack && cd Stypical_lacklack && git checkout 0959ed15fc96078cbb053e4e3c259a62b3e9e296 && cd ..
fi

if [ ! -d "Synic-dx_blackJack" ]; then
  echo "Cloning branch main from Synic-dx/blackJack..."
  git clone --depth 1 --branch main https://github.com/Synic-dx/blackJack.git Synic-dx_blackJack
fi

if [ ! -d "TWS2401_Sonic-CD-WASM" ]; then
  echo "Cloning branch main from TWS2401/Sonic-CD-WASM..."
  git clone --depth 1 --branch main https://github.com/TWS2401/Sonic-CD-WASM.git TWS2401_Sonic-CD-WASM
fi

if [ ! -d "TeamNitrous_projectplatinum" ]; then
  echo "Cloning commit bbdbab4e5ecae1bd832ce9cba0b23205a3ba5c8c from TeamNitrous/projectplatinum..."
  git clone https://github.com/TeamNitrous/projectplatinum.git TeamNitrous_projectplatinum && cd TeamNitrous_projectplatinum && git checkout bbdbab4e5ecae1bd832ce9cba0b23205a3ba5c8c && cd ..
fi

if [ ! -d "UniverseExploits_flash-games" ]; then
  echo "Cloning commit 8a30ea684498b868a7b1cd188bd860ba2042eb56 from UniverseExploits/flash-games..."
  git clone https://github.com/UniverseExploits/flash-games.git UniverseExploits_flash-games && cd UniverseExploits_flash-games && git checkout 8a30ea684498b868a7b1cd188bd860ba2042eb56 && cd ..
fi

if [ ! -d "Ven0mYT_tube-jumpers-ven0m" ]; then
  echo "Cloning commit d7e473d1bbb19c421a23516ef2202bda21e8c3f0 from Ven0mYT/tube-jumpers-ven0m..."
  git clone https://github.com/Ven0mYT/tube-jumpers-ven0m.git Ven0mYT_tube-jumpers-ven0m && cd Ven0mYT_tube-jumpers-ven0m && git checkout d7e473d1bbb19c421a23516ef2202bda21e8c3f0 && cd ..
fi

if [ ! -d "Vrkids2009_snowrider3d" ]; then
  echo "Cloning commit 6b7c2b9167b592528b221428414e63f06c4640b9 from Vrkids2009/snowrider3d..."
  git clone https://github.com/Vrkids2009/snowrider3d.git Vrkids2009_snowrider3d && cd Vrkids2009_snowrider3d && git checkout 6b7c2b9167b592528b221428414e63f06c4640b9 && cd ..
fi

if [ ! -d "WhoIsEv_relivedassets" ]; then
  echo "Cloning commit 78f01b889b5f57c1bc0f260a38d5eabf51923f40 from WhoIsEv/relivedassets..."
  git clone https://github.com/WhoIsEv/relivedassets.git WhoIsEv_relivedassets && cd WhoIsEv_relivedassets && git checkout 78f01b889b5f57c1bc0f260a38d5eabf51923f40 && cd ..
fi

if [ ! -d "WhoIsEv_relivedassets" ]; then
  echo "Cloning branch main from WhoIsEv/relivedassets..."
  git clone --depth 1 --branch main https://github.com/WhoIsEv/relivedassets.git WhoIsEv_relivedassets
fi

if [ ! -d "a456pur_seraph" ]; then
  echo "Cloning commit 81f551ca0aa8e3d6018d32d8ac5904ac9bc78f76 from a456pur/seraph..."
  git clone https://github.com/a456pur/seraph.git a456pur_seraph && cd a456pur_seraph && git checkout 81f551ca0aa8e3d6018d32d8ac5904ac9bc78f76 && cd ..
fi

if [ ! -d "a456pur_seraph" ]; then
  echo "Cloning commit ae2fcc6d6a9cd051654fcc0519080db1f79cf2a7 from a456pur/seraph..."
  git clone https://github.com/a456pur/seraph.git a456pur_seraph && cd a456pur_seraph && git checkout ae2fcc6d6a9cd051654fcc0519080db1f79cf2a7 && cd ..
fi

if [ ! -d "angrybirds-s4uk_angrybirdschrome-source-html5" ]; then
  echo "Cloning branch main from angrybirds-s4uk/angrybirdschrome-source-html5..."
  git clone --depth 1 --branch main https://github.com/angrybirds-s4uk/angrybirdschrome-source-html5.git angrybirds-s4uk_angrybirdschrome-source-html5
fi

if [ ! -d "arwds_Arowadas" ]; then
  echo "Cloning commit 7be59f866ec50056109ed7a4b2a227a5f0494025 from arwds/Arowadas..."
  git clone https://github.com/arwds/Arowadas.git arwds_Arowadas && cd arwds_Arowadas && git checkout 7be59f866ec50056109ed7a4b2a227a5f0494025 && cd ..
fi

if [ ! -d "asianmemeboi_AAA-Fun-World" ]; then
  echo "Cloning commit 2f45ea1aca0db7f1963e694bc2034d9ea885585b from asianmemeboi/AAA-Fun-World..."
  git clone https://github.com/asianmemeboi/AAA-Fun-World.git asianmemeboi_AAA-Fun-World && cd asianmemeboi_AAA-Fun-World && git checkout 2f45ea1aca0db7f1963e694bc2034d9ea885585b && cd ..
fi

if [ ! -d "asianmemeboi_AAA-Fun-World" ]; then
  echo "Cloning commit 6ecabf5eced5e166e4cf7ed9c45510512be15a75 from asianmemeboi/AAA-Fun-World..."
  git clone https://github.com/asianmemeboi/AAA-Fun-World.git asianmemeboi_AAA-Fun-World && cd asianmemeboi_AAA-Fun-World && git checkout 6ecabf5eced5e166e4cf7ed9c45510512be15a75 && cd ..
fi

if [ ! -d "asianmemeboi_AAA-Fun-World" ]; then
  echo "Cloning commit ab575a02be519d81b04e1141d0de42da4eba0997 from asianmemeboi/AAA-Fun-World..."
  git clone https://github.com/asianmemeboi/AAA-Fun-World.git asianmemeboi_AAA-Fun-World && cd asianmemeboi_AAA-Fun-World && git checkout ab575a02be519d81b04e1141d0de42da4eba0997 && cd ..
fi

if [ ! -d "aukak_gameports" ]; then
  echo "Cloning branch main from aukak/gameports..."
  git clone --depth 1 --branch main https://github.com/aukak/gameports.git aukak_gameports
fi

if [ ! -d "awaiblecomponent_575" ]; then
  echo "Cloning branch main from awaiblecomponent/575..."
  git clone --depth 1 --branch main https://github.com/awaiblecomponent/575.git awaiblecomponent_575
fi

if [ ! -d "bagel-man_eggyolkers" ]; then
  echo "Cloning commit 638d286c58b7952af5ee59af75587db454f3b798 from bagel-man/eggyolkers..."
  git clone https://github.com/bagel-man/eggyolkers.git bagel-man_eggyolkers && cd bagel-man_eggyolkers && git checkout 638d286c58b7952af5ee59af75587db454f3b798 && cd ..
fi

if [ ! -d "bavlin-san7990_react" ]; then
  echo "Cloning commit a2f035b519b99dbc2c69f174cf9788b56cb36c32 from bavlin-san7990/react..."
  git clone https://github.com/bavlin-san7990/react.git bavlin-san7990_react && cd bavlin-san7990_react && git checkout a2f035b519b99dbc2c69f174cf9788b56cb36c32 && cd ..
fi

if [ ! -d "bcat1023_webprx" ]; then
  echo "Cloning commit b2f2d5d966ed6d99734ea61c5a6a15c83140a93c from bcat1023/webprx..."
  git clone https://github.com/bcat1023/webprx.git bcat1023_webprx && cd bcat1023_webprx && git checkout b2f2d5d966ed6d99734ea61c5a6a15c83140a93c && cd ..
fi

if [ ! -d "benito-camarillo_Whitespider" ]; then
  echo "Cloning commit 58638549cf66e46471d33ed01827017dd067acb5 from benito-camarillo/Whitespider..."
  git clone https://github.com/benito-camarillo/Whitespider.git benito-camarillo_Whitespider && cd benito-camarillo_Whitespider && git checkout 58638549cf66e46471d33ed01827017dd067acb5 && cd ..
fi

if [ ! -d "bobydob_JSEngine" ]; then
  echo "Cloning commit 081fe818fd0f1b2f8ae31a88f5fee4a3ac3aa346 from bobydob/JSEngine..."
  git clone https://github.com/bobydob/JSEngine.git bobydob_JSEngine && cd bobydob_JSEngine && git checkout 081fe818fd0f1b2f8ae31a88f5fee4a3ac3aa346 && cd ..
fi

if [ ! -d "bobydob_JSEngine" ]; then
  echo "Cloning commit 0e96212fb7b2e7aa0a310d3ebe3a8ab01a114b4b from bobydob/JSEngine..."
  git clone https://github.com/bobydob/JSEngine.git bobydob_JSEngine && cd bobydob_JSEngine && git checkout 0e96212fb7b2e7aa0a310d3ebe3a8ab01a114b4b && cd ..
fi

if [ ! -d "bobydob_JSEngine" ]; then
  echo "Cloning commit 4c04e7fb85008b3d23ba8848826ba2c0a859fa4f from bobydob/JSEngine..."
  git clone https://github.com/bobydob/JSEngine.git bobydob_JSEngine && cd bobydob_JSEngine && git checkout 4c04e7fb85008b3d23ba8848826ba2c0a859fa4f && cd ..
fi

if [ ! -d "bobydob_godotpack" ]; then
  echo "Cloning commit 137b954a7a2d8e0a28efe82a778000c02bcc1481 from bobydob/godotpack..."
  git clone https://github.com/bobydob/godotpack.git bobydob_godotpack && cd bobydob_godotpack && git checkout 137b954a7a2d8e0a28efe82a778000c02bcc1481 && cd ..
fi

if [ ! -d "bobydob_godotpack" ]; then
  echo "Cloning commit 4c6d9fa05fc283afaf4339211ea7d441488efad7 from bobydob/godotpack..."
  git clone https://github.com/bobydob/godotpack.git bobydob_godotpack && cd bobydob_godotpack && git checkout 4c6d9fa05fc283afaf4339211ea7d441488efad7 && cd ..
fi

if [ ! -d "bobydob_godotpack" ]; then
  echo "Cloning commit eee6707129e6b8de0315fa9a296cec67aa16f6d8 from bobydob/godotpack..."
  git clone https://github.com/bobydob/godotpack.git bobydob_godotpack && cd bobydob_godotpack && git checkout eee6707129e6b8de0315fa9a296cec67aa16f6d8 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 354e3c6939a08e472482653567d566ba3a2aa527 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 354e3c6939a08e472482653567d566ba3a2aa527 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 359c6694a88f2c5eddbb9257f3e1d49c668ce749 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 359c6694a88f2c5eddbb9257f3e1d49c668ce749 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 5765230aac4c0072a5b1021eab4a6a4b9df597f9 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 5765230aac4c0072a5b1021eab4a6a4b9df597f9 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 5d03e63d760d24f4d1a0d3d7757cfae820b58814 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 5d03e63d760d24f4d1a0d3d7757cfae820b58814 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 60243fe19e191ac4fc09b71c48b965cf25f30f5c from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 60243fe19e191ac4fc09b71c48b965cf25f30f5c && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 6abd0105b36398d6479b3c064d3520d52ff0c96e from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 6abd0105b36398d6479b3c064d3520d52ff0c96e && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 73c3ee879d029ed516e299c98849af5bc14871ff from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 73c3ee879d029ed516e299c98849af5bc14871ff && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 8270f39794953f1418b8117f254fd6d262407bb8 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 8270f39794953f1418b8117f254fd6d262407bb8 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit 9defddfd6a5653144cd8c423f6fb83d532dc9967 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout 9defddfd6a5653144cd8c423f6fb83d532dc9967 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit a39ea4b5ce534bf7b1c21000a2a0929fef178a1e from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout a39ea4b5ce534bf7b1c21000a2a0929fef178a1e && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit ae6706e5224c55594c491edfc7f5ad541e2ea02b from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout ae6706e5224c55594c491edfc7f5ad541e2ea02b && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit c8207b769940d128480c318e32b5d366a665db5b from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout c8207b769940d128480c318e32b5d366a665db5b && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit d7f8079f5d979182e04f05b1ade24f2a757253a3 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout d7f8079f5d979182e04f05b1ade24f2a757253a3 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit df3f505bea1fcfbe3f7e0e64c384e9ec15b47ee1 from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout df3f505bea1fcfbe3f7e0e64c384e9ec15b47ee1 && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit e4eef50361d9e575bc7cd834e14388c6e675a67e from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout e4eef50361d9e575bc7cd834e14388c6e675a67e && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning commit eb32298b67aacb3c73695ddfd68cb04803b3235e from bubbls/UGS-Assets..."
  git clone https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets && cd bubbls_UGS-Assets && git checkout eb32298b67aacb3c73695ddfd68cb04803b3235e && cd ..
fi

if [ ! -d "bubbls_UGS-Assets" ]; then
  echo "Cloning branch main from bubbls/UGS-Assets..."
  git clone --depth 1 --branch main https://github.com/bubbls/UGS-Assets.git bubbls_UGS-Assets
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit 03ae5a340e20d61038bf2b7bb749d8ae702183f1 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout 03ae5a340e20d61038bf2b7bb749d8ae702183f1 && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit 06fda9100fefe4f32cf5b5d5ba022b61a7fa74f6 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout 06fda9100fefe4f32cf5b5d5ba022b61a7fa74f6 && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit 083a486880746c027bc1c62d685c7b3052a90bc5 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout 083a486880746c027bc1c62d685c7b3052a90bc5 && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit 0e0689468e03808c3125d32de2b00b5b1575f899 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout 0e0689468e03808c3125d32de2b00b5b1575f899 && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit 5b0d188b716d05bd4264c4096ad358d5add6388e from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout 5b0d188b716d05bd4264c4096ad358d5add6388e && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit 754a57837e92bb4552e8247c6a401bd4ce8e4ee7 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout 754a57837e92bb4552e8247c6a401bd4ce8e4ee7 && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit a3f1c2d9db55885e9c8279cf22cf6ceba4451152 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout a3f1c2d9db55885e9c8279cf22cf6ceba4451152 && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit cf2db6e9366385521ac2ce4e87b8d364aac61a37 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout cf2db6e9366385521ac2ce4e87b8d364aac61a37 && cd ..
fi

if [ ! -d "bubbls_UGS-file-encryption" ]; then
  echo "Cloning commit e0c78a58432c6486ebe1a50a78d263df65809a83 from bubbls/UGS-file-encryption..."
  git clone https://github.com/bubbls/UGS-file-encryption.git bubbls_UGS-file-encryption && cd bubbls_UGS-file-encryption && git checkout e0c78a58432c6486ebe1a50a78d263df65809a83 && cd ..
fi

if [ ! -d "bubbls_escape-road" ]; then
  echo "Cloning commit 45b2d69c626dc365753f6922d2c48c4075683ef5 from bubbls/escape-road..."
  git clone https://github.com/bubbls/escape-road.git bubbls_escape-road && cd bubbls_escape-road && git checkout 45b2d69c626dc365753f6922d2c48c4075683ef5 && cd ..
fi

if [ ! -d "bubbls_fnf-mods" ]; then
  echo "Cloning commit 6b6680f79ab8c4e8349a920c2a240c5e7ee689ea from bubbls/fnf-mods..."
  git clone https://github.com/bubbls/fnf-mods.git bubbls_fnf-mods && cd bubbls_fnf-mods && git checkout 6b6680f79ab8c4e8349a920c2a240c5e7ee689ea && cd ..
fi

if [ ! -d "bubbls_fnf-mods" ]; then
  echo "Cloning commit 72c8d4c250ac08d604f1c928274e52373d998fad from bubbls/fnf-mods..."
  git clone https://github.com/bubbls/fnf-mods.git bubbls_fnf-mods && cd bubbls_fnf-mods && git checkout 72c8d4c250ac08d604f1c928274e52373d998fad && cd ..
fi

if [ ! -d "bubbls_fnf-mods" ]; then
  echo "Cloning branch main from bubbls/fnf-mods..."
  git clone --depth 1 --branch main https://github.com/bubbls/fnf-mods.git bubbls_fnf-mods
fi

if [ ! -d "bubbls_ruffle" ]; then
  echo "Cloning commit 1520d90d7b2994737acd8f7a633d018f63c22ca7 from bubbls/ruffle..."
  git clone https://github.com/bubbls/ruffle.git bubbls_ruffle && cd bubbls_ruffle && git checkout 1520d90d7b2994737acd8f7a633d018f63c22ca7 && cd ..
fi

if [ ! -d "bubbls_ruffle" ]; then
  echo "Cloning commit 25f6152ab54ec5409c832c904ed3e5e482600d6a from bubbls/ruffle..."
  git clone https://github.com/bubbls/ruffle.git bubbls_ruffle && cd bubbls_ruffle && git checkout 25f6152ab54ec5409c832c904ed3e5e482600d6a && cd ..
fi

if [ ! -d "bubbls_ruffle" ]; then
  echo "Cloning commit 8ba7f083496ec787377881857d02bb2012cd7ffa from bubbls/ruffle..."
  git clone https://github.com/bubbls/ruffle.git bubbls_ruffle && cd bubbls_ruffle && git checkout 8ba7f083496ec787377881857d02bb2012cd7ffa && cd ..
fi

if [ ! -d "bubbls_ruffle" ]; then
  echo "Cloning commit a25d711e6294241dd4ad89f5ef65dc6bf34fcb24 from bubbls/ruffle..."
  git clone https://github.com/bubbls/ruffle.git bubbls_ruffle && cd bubbls_ruffle && git checkout a25d711e6294241dd4ad89f5ef65dc6bf34fcb24 && cd ..
fi

if [ ! -d "bubbls_ugss" ]; then
  echo "Cloning commit 0ee58e0c98781c822a21217f33b7f3f74c5ebe32 from bubbls/ugss..."
  git clone https://github.com/bubbls/ugss.git bubbls_ugss && cd bubbls_ugss && git checkout 0ee58e0c98781c822a21217f33b7f3f74c5ebe32 && cd ..
fi

if [ ! -d "bubbls_ugss" ]; then
  echo "Cloning commit 1406dbc5f74cfd6bac77c56cd83784a184b986a5 from bubbls/ugss..."
  git clone https://github.com/bubbls/ugss.git bubbls_ugss && cd bubbls_ugss && git checkout 1406dbc5f74cfd6bac77c56cd83784a184b986a5 && cd ..
fi

if [ ! -d "bubbls_ugss" ]; then
  echo "Cloning commit 3eb957d7d5b10de8e9cba751f6a792ca2c355322 from bubbls/ugss..."
  git clone https://github.com/bubbls/ugss.git bubbls_ugss && cd bubbls_ugss && git checkout 3eb957d7d5b10de8e9cba751f6a792ca2c355322 && cd ..
fi

if [ ! -d "bubbls_ugss" ]; then
  echo "Cloning commit 47402aa6cc2cdf16a607f0fcd155fcbea187ad93 from bubbls/ugss..."
  git clone https://github.com/bubbls/ugss.git bubbls_ugss && cd bubbls_ugss && git checkout 47402aa6cc2cdf16a607f0fcd155fcbea187ad93 && cd ..
fi

if [ ! -d "bubbls_ugss" ]; then
  echo "Cloning commit 6941142865266e23714bc91b65f9d215de687067 from bubbls/ugss..."
  git clone https://github.com/bubbls/ugss.git bubbls_ugss && cd bubbls_ugss && git checkout 6941142865266e23714bc91b65f9d215de687067 && cd ..
fi

if [ ! -d "bubbls_ugss" ]; then
  echo "Cloning commit ffa46738ce21236742f4a44db08d87160fed6c7d from bubbls/ugss..."
  git clone https://github.com/bubbls/ugss.git bubbls_ugss && cd bubbls_ugss && git checkout ffa46738ce21236742f4a44db08d87160fed6c7d && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 149c5018a75690eac83f052bfc6601e31ec0459b from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 149c5018a75690eac83f052bfc6601e31ec0459b && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 1b8d5d149e9498d3ea95aad1037d1411511d41d3 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 1b8d5d149e9498d3ea95aad1037d1411511d41d3 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 213d19aad1db5acdebe8e07a80ae4998f3146e33 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 213d19aad1db5acdebe8e07a80ae4998f3146e33 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 5eb5f778f51fbfc9e2454dfc7fae22e18dad675a from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 5eb5f778f51fbfc9e2454dfc7fae22e18dad675a && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 7c0b0f0a4803764b608f96649e0970d56c2b860a from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 7c0b0f0a4803764b608f96649e0970d56c2b860a && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 86ba622d4f23e944352f50b6052fa16f22c5250d from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 86ba622d4f23e944352f50b6052fa16f22c5250d && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 8b29ce29cd86c8fb4f46fa5b63d3a0f4f32c5d4e from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 8b29ce29cd86c8fb4f46fa5b63d3a0f4f32c5d4e && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit 8c0add17e99e4cbe9eaf6bb9e7487c3ad08c915a from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout 8c0add17e99e4cbe9eaf6bb9e7487c3ad08c915a && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit af7a20f1ed51753e07b394f8680eaa5699d1fc2c from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout af7a20f1ed51753e07b394f8680eaa5699d1fc2c && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit c5eefc5c13316b94c58e63cb5270b99a13c88fea from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout c5eefc5c13316b94c58e63cb5270b99a13c88fea && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit d81a7682885569a11f3258c4d1ca63d57328f7a4 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout d81a7682885569a11f3258c4d1ca63d57328f7a4 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit deb1b2add97f0d2eccb9d8c6a2fc540e54cd4a9e from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout deb1b2add97f0d2eccb9d8c6a2fc540e54cd4a9e && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit eab0be3e71847f40b826f0cc275a620c64d9aba0 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout eab0be3e71847f40b826f0cc275a620c64d9aba0 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit ec4484a07a5d576d25b4bc577df6801b2e8ffb84 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout ec4484a07a5d576d25b4bc577df6801b2e8ffb84 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit ed57fd6dbc91143221b05fdf61be73bacc375843 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout ed57fd6dbc91143221b05fdf61be73bacc375843 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit f86d947cd3a8c7271fc251ae687bb8c9ffd2a170 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout f86d947cd3a8c7271fc251ae687bb8c9ffd2a170 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning commit fea22b681fcc55bd6d5b059e2843120d3fbf7dd6 from bubbls/youtube-playables..."
  git clone https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables && cd bubbls_youtube-playables && git checkout fea22b681fcc55bd6d5b059e2843120d3fbf7dd6 && cd ..
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning branch latest from bubbls/youtube-playables..."
  git clone --depth 1 --branch latest https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables
fi

if [ ! -d "bubbls_youtube-playables" ]; then
  echo "Cloning branch main from bubbls/youtube-playables..."
  git clone --depth 1 --branch main https://github.com/bubbls/youtube-playables.git bubbls_youtube-playables
fi

if [ ! -d "burnedpopcorn_SonicManiaPlusWebPort" ]; then
  echo "Cloning branch main from burnedpopcorn/SonicManiaPlusWebPort..."
  git clone --depth 1 --branch main https://github.com/burnedpopcorn/SonicManiaPlusWebPort.git burnedpopcorn_SonicManiaPlusWebPort
fi

if [ ! -d "faralong_test" ]; then
  echo "Cloning branch main from faralong/test..."
  git clone --depth 1 --branch main https://github.com/faralong/test.git faralong_test
fi

if [ ! -d "fork-so-the-site-i-take-wont-be-deleted_bulbasaurchat.github.io" ]; then
  echo "Cloning commit de2858a9fa7b7176cee2788842d4278686969811 from fork-so-the-site-i-take-wont-be-deleted/bulbasaurchat.github.io..."
  git clone https://github.com/fork-so-the-site-i-take-wont-be-deleted/bulbasaurchat.github.io.git fork-so-the-site-i-take-wont-be-deleted_bulbasaurchat.github.io && cd fork-so-the-site-i-take-wont-be-deleted_bulbasaurchat.github.io && git checkout de2858a9fa7b7176cee2788842d4278686969811 && cd ..
fi

if [ ! -d "fork-so-the-site-i-take-wont-be-deleted_bulbasaurchat.github.io" ]; then
  echo "Cloning branch main from fork-so-the-site-i-take-wont-be-deleted/bulbasaurchat.github.io..."
  git clone --depth 1 --branch main https://github.com/fork-so-the-site-i-take-wont-be-deleted/bulbasaurchat.github.io.git fork-so-the-site-i-take-wont-be-deleted_bulbasaurchat.github.io
fi

if [ ! -d "forms-docs-slides-glgl_ngng" ]; then
  echo "Cloning branch main from forms-docs-slides-glgl/ngng..."
  git clone --depth 1 --branch main https://github.com/forms-docs-slides-glgl/ngng.git forms-docs-slides-glgl_ngng
fi

if [ ! -d "genizy_Quake3" ]; then
  echo "Cloning branch master from genizy/Quake3..."
  git clone --depth 1 --branch master https://github.com/genizy/Quake3.git genizy_Quake3
fi

if [ ! -d "genizy_assets" ]; then
  echo "Cloning commit ff73bc4b150bcc3d18fe719bdb50e4338742e4f9 from genizy/assets..."
  git clone https://github.com/genizy/assets.git genizy_assets && cd genizy_assets && git checkout ff73bc4b150bcc3d18fe719bdb50e4338742e4f9 && cd ..
fi

if [ ! -d "genizy_assets" ]; then
  echo "Cloning branch main from genizy/assets..."
  git clone --depth 1 --branch main https://github.com/genizy/assets.git genizy_assets
fi

if [ ! -d "genizy_biologyexams" ]; then
  echo "Cloning branch main from genizy/biologyexams..."
  git clone --depth 1 --branch main https://github.com/genizy/biologyexams.git genizy_biologyexams
fi

if [ ! -d "genizy_brainrot" ]; then
  echo "Cloning branch main from genizy/brainrot..."
  git clone --depth 1 --branch main https://github.com/genizy/brainrot.git genizy_brainrot
fi

if [ ! -d "genizy_cc3d-mobile" ]; then
  echo "Cloning branch main from genizy/cc3d-mobile..."
  git clone --depth 1 --branch main https://github.com/genizy/cc3d-mobile.git genizy_cc3d-mobile
fi

if [ ! -d "genizy_cg-rip" ]; then
  echo "Cloning branch main from genizy/cg-rip..."
  git clone --depth 1 --branch main https://github.com/genizy/cg-rip.git genizy_cg-rip
fi

if [ ! -d "genizy_code-editor" ]; then
  echo "Cloning branch main from genizy/code-editor..."
  git clone --depth 1 --branch main https://github.com/genizy/code-editor.git genizy_code-editor
fi

if [ ! -d "genizy_dmad-poki" ]; then
  echo "Cloning commit 49b5ab6b987f5f3be58f9dae59c92e8fc1aab9b0 from genizy/dmad-poki..."
  git clone https://github.com/genizy/dmad-poki.git genizy_dmad-poki && cd genizy_dmad-poki && git checkout 49b5ab6b987f5f3be58f9dae59c92e8fc1aab9b0 && cd ..
fi

if [ ! -d "genizy_emu" ]; then
  echo "Cloning commit 7bf5cbb0b94866568d2aaa1fd42ebb5acd517e0d from genizy/emu..."
  git clone https://github.com/genizy/emu.git genizy_emu && cd genizy_emu && git checkout 7bf5cbb0b94866568d2aaa1fd42ebb5acd517e0d && cd ..
fi

if [ ! -d "genizy_emu" ]; then
  echo "Cloning branch master from genizy/emu..."
  git clone --depth 1 --branch master https://github.com/genizy/emu.git genizy_emu
fi

if [ ! -d "genizy_emujs" ]; then
  echo "Cloning branch main from genizy/emujs..."
  git clone --depth 1 --branch main https://github.com/genizy/emujs.git genizy_emujs
fi

if [ ! -d "genizy_fancade" ]; then
  echo "Cloning branch main from genizy/fancade..."
  git clone --depth 1 --branch main https://github.com/genizy/fancade.git genizy_fancade
fi

if [ ! -d "genizy_fnaf" ]; then
  echo "Cloning commit f9b32ba6486504f1f6a2117c3201590fcbb132c5 from genizy/fnaf..."
  git clone https://github.com/genizy/fnaf.git genizy_fnaf && cd genizy_fnaf && git checkout f9b32ba6486504f1f6a2117c3201590fcbb132c5 && cd ..
fi

if [ ! -d "genizy_fnaf" ]; then
  echo "Cloning branch latest from genizy/fnaf..."
  git clone --depth 1 --branch latest https://github.com/genizy/fnaf.git genizy_fnaf
fi

if [ ! -d "genizy_fnaf" ]; then
  echo "Cloning branch main from genizy/fnaf..."
  git clone --depth 1 --branch main https://github.com/genizy/fnaf.git genizy_fnaf
fi

if [ ! -d "genizy_google-class" ]; then
  echo "Cloning commit 23207b238c7c587d12da3cac4233366120ea47c0 from genizy/google-class..."
  git clone https://github.com/genizy/google-class.git genizy_google-class && cd genizy_google-class && git checkout 23207b238c7c587d12da3cac4233366120ea47c0 && cd ..
fi

if [ ! -d "genizy_google-class" ]; then
  echo "Cloning commit 27c6b09079ae1e75e5fe401aa75276c7a72005fc from genizy/google-class..."
  git clone https://github.com/genizy/google-class.git genizy_google-class && cd genizy_google-class && git checkout 27c6b09079ae1e75e5fe401aa75276c7a72005fc && cd ..
fi

if [ ! -d "genizy_google-class" ]; then
  echo "Cloning commit 98d73056bfa9d476eb9fb3df8eaf418fba6d6f01 from genizy/google-class..."
  git clone https://github.com/genizy/google-class.git genizy_google-class && cd genizy_google-class && git checkout 98d73056bfa9d476eb9fb3df8eaf418fba6d6f01 && cd ..
fi

if [ ! -d "genizy_google-class" ]; then
  echo "Cloning commit cd06df26d3c4d9f73c8151fc13f7b2dc27f3adda from genizy/google-class..."
  git clone https://github.com/genizy/google-class.git genizy_google-class && cd genizy_google-class && git checkout cd06df26d3c4d9f73c8151fc13f7b2dc27f3adda && cd ..
fi

if [ ! -d "genizy_google-class" ]; then
  echo "Cloning branch main from genizy/google-class..."
  git clone --depth 1 --branch main https://github.com/genizy/google-class.git genizy_google-class
fi

if [ ! -d "genizy_google-doodles" ]; then
  echo "Cloning commit 40ec0a87ee9f32365afcf40edc257ae8afacde26 from genizy/google-doodles..."
  git clone https://github.com/genizy/google-doodles.git genizy_google-doodles && cd genizy_google-doodles && git checkout 40ec0a87ee9f32365afcf40edc257ae8afacde26 && cd ..
fi

if [ ! -d "genizy_ice-dodo" ]; then
  echo "Cloning commit b950830c255518c930fbc2a0bd3182e7d4cc920c from genizy/ice-dodo..."
  git clone https://github.com/genizy/ice-dodo.git genizy_ice-dodo && cd genizy_ice-dodo && git checkout b950830c255518c930fbc2a0bd3182e7d4cc920c && cd ..
fi

if [ ! -d "genizy_jride" ]; then
  echo "Cloning commit 475e65ec2f642cf50bb80f09f4f4188cf8c26faa from genizy/jride..."
  git clone https://github.com/genizy/jride.git genizy_jride && cd genizy_jride && git checkout 475e65ec2f642cf50bb80f09f4f4188cf8c26faa && cd ..
fi

if [ ! -d "genizy_mc" ]; then
  echo "Cloning branch main from genizy/mc..."
  git clone --depth 1 --branch main https://github.com/genizy/mc.git genizy_mc
fi

if [ ! -d "genizy_monkey-mart-mobile" ]; then
  echo "Cloning commit 89836e4c54e87739ace84f6fe801b423185cc51d from genizy/monkey-mart-mobile..."
  git clone https://github.com/genizy/monkey-mart-mobile.git genizy_monkey-mart-mobile && cd genizy_monkey-mart-mobile && git checkout 89836e4c54e87739ace84f6fe801b423185cc51d && cd ..
fi

if [ ! -d "genizy_osu" ]; then
  echo "Cloning commit aabb0e62f0ebfbf4f472c9e86be0b3e7cf4540bc from genizy/osu..."
  git clone https://github.com/genizy/osu.git genizy_osu && cd genizy_osu && git checkout aabb0e62f0ebfbf4f472c9e86be0b3e7cf4540bc && cd ..
fi

if [ ! -d "genizy_ovo-3-dimension" ]; then
  echo "Cloning commit 102179bf4242fd237c46c555ba154c2f325d351c from genizy/ovo-3-dimension..."
  git clone https://github.com/genizy/ovo-3-dimension.git genizy_ovo-3-dimension && cd genizy_ovo-3-dimension && git checkout 102179bf4242fd237c46c555ba154c2f325d351c && cd ..
fi

if [ ! -d "genizy_polytrack" ]; then
  echo "Cloning branch main from genizy/polytrack..."
  git clone --depth 1 --branch main https://github.com/genizy/polytrack.git genizy_polytrack
fi

if [ ! -d "genizy_retro-bowl-college" ]; then
  echo "Cloning branch main from genizy/retro-bowl-college..."
  git clone --depth 1 --branch main https://github.com/genizy/retro-bowl-college.git genizy_retro-bowl-college
fi

if [ ! -d "genizy_slither" ]; then
  echo "Cloning branch latest from genizy/slither..."
  git clone --depth 1 --branch latest https://github.com/genizy/slither.git genizy_slither
fi

if [ ! -d "genizy_soundboard" ]; then
  echo "Cloning branch main from genizy/soundboard..."
  git clone --depth 1 --branch main https://github.com/genizy/soundboard.git genizy_soundboard
fi

if [ ! -d "genizy_subway-surfers" ]; then
  echo "Cloning commit 829234f4d9f0bc46347e67b0a8d3b033dc70a589 from genizy/subway-surfers..."
  git clone https://github.com/genizy/subway-surfers.git genizy_subway-surfers && cd genizy_subway-surfers && git checkout 829234f4d9f0bc46347e67b0a8d3b033dc70a589 && cd ..
fi

if [ ! -d "genizy_subwaysurfers" ]; then
  echo "Cloning commit ad59db5a60898501131836ac9aa66ff68dd83fad from genizy/subwaysurfers..."
  git clone https://github.com/genizy/subwaysurfers.git genizy_subwaysurfers && cd genizy_subwaysurfers && git checkout ad59db5a60898501131836ac9aa66ff68dd83fad && cd ..
fi

if [ ! -d "genizy_vex" ]; then
  echo "Cloning commit 1340a1189f16869133a4a42f11554b5d0ccc064b from genizy/vex..."
  git clone https://github.com/genizy/vex.git genizy_vex && cd genizy_vex && git checkout 1340a1189f16869133a4a42f11554b5d0ccc064b && cd ..
fi

if [ ! -d "genizy_web-port" ]; then
  echo "Cloning commit 4e018d7f2ca2b3d77ecfd0123d2926421e2b26a5 from genizy/web-port..."
  git clone https://github.com/genizy/web-port.git genizy_web-port && cd genizy_web-port && git checkout 4e018d7f2ca2b3d77ecfd0123d2926421e2b26a5 && cd ..
fi

if [ ! -d "genizy_web-port" ]; then
  echo "Cloning commit 725a19f20c3f376529284c9f86299581719e8d19 from genizy/web-port..."
  git clone https://github.com/genizy/web-port.git genizy_web-port && cd genizy_web-port && git checkout 725a19f20c3f376529284c9f86299581719e8d19 && cd ..
fi

if [ ! -d "genizy_web-port" ]; then
  echo "Cloning commit de75523557e46f375fc9173a9a0c0d34d8ed34f9 from genizy/web-port..."
  git clone https://github.com/genizy/web-port.git genizy_web-port && cd genizy_web-port && git checkout de75523557e46f375fc9173a9a0c0d34d8ed34f9 && cd ..
fi

if [ ! -d "genizy_web-port" ]; then
  echo "Cloning commit f80c14f1508260870d9b10f5acbf73fc4b77764e from genizy/web-port..."
  git clone https://github.com/genizy/web-port.git genizy_web-port && cd genizy_web-port && git checkout f80c14f1508260870d9b10f5acbf73fc4b77764e && cd ..
fi

if [ ! -d "genizy_web-port" ]; then
  echo "Cloning branch latest from genizy/web-port..."
  git clone --depth 1 --branch latest https://github.com/genizy/web-port.git genizy_web-port
fi

if [ ! -d "genizy_web-port" ]; then
  echo "Cloning branch main from genizy/web-port..."
  git clone --depth 1 --branch main https://github.com/genizy/web-port.git genizy_web-port
fi

if [ ! -d "genizy_web-port" ]; then
  echo "Cloning branch master from genizy/web-port..."
  git clone --depth 1 --branch master https://github.com/genizy/web-port.git genizy_web-port
fi

if [ ! -d "gertdoro_UnityExplorer" ]; then
  echo "Cloning commit cffa09e09790018403c996d37adb6c4450e8f6c6 from gertdoro/UnityExplorer..."
  git clone https://github.com/gertdoro/UnityExplorer.git gertdoro_UnityExplorer && cd gertdoro_UnityExplorer && git checkout cffa09e09790018403c996d37adb6c4450e8f6c6 && cd ..
fi

if [ ! -d "gn-math_assets" ]; then
  echo "Cloning commit 51462750d29b68ac1e33887c1bf13d9c478d5ead from gn-math/assets..."
  git clone https://github.com/gn-math/assets.git gn-math_assets && cd gn-math_assets && git checkout 51462750d29b68ac1e33887c1bf13d9c478d5ead && cd ..
fi

if [ ! -d "gn-math_assets" ]; then
  echo "Cloning commit f10a05af96d9a4b0f1852310e50866825c083210 from gn-math/assets..."
  git clone https://github.com/gn-math/assets.git gn-math_assets && cd gn-math_assets && git checkout f10a05af96d9a4b0f1852310e50866825c083210 && cd ..
fi

if [ ! -d "gn-math_assets" ]; then
  echo "Cloning branch main from gn-math/assets..."
  git clone --depth 1 --branch main https://github.com/gn-math/assets.git gn-math_assets
fi

if [ ! -d "goobertime_math" ]; then
  echo "Cloning commit 12f2387f37be9b093112414ab5e6ab148c154c94 from goobertime/math..."
  git clone https://github.com/goobertime/math.git goobertime_math && cd goobertime_math && git checkout 12f2387f37be9b093112414ab5e6ab148c154c94 && cd ..
fi

if [ ! -d "greggman_webgl-helpers" ]; then
  echo "Cloning commit 06e3d45373af0f3ce8f58b472b61835d9678d23a from greggman/webgl-helpers..."
  git clone https://github.com/greggman/webgl-helpers.git greggman_webgl-helpers && cd greggman_webgl-helpers && git checkout 06e3d45373af0f3ce8f58b472b61835d9678d23a && cd ..
fi

if [ ! -d "gru6nny_ohd" ]; then
  echo "Cloning branch main from gru6nny/ohd..."
  git clone --depth 1 --branch main https://github.com/gru6nny/ohd.git gru6nny_ohd
fi

if [ ! -d "highlightjs_cdn-release" ]; then
  echo "Cloning branch 11.9.0 from highlightjs/cdn-release..."
  git clone --depth 1 --branch 11.9.0 https://github.com/highlightjs/cdn-release.git highlightjs_cdn-release
fi

if [ ! -d "illusionTBA_React-Ruffle" ]; then
  echo "Cloning commit f37551ff7c55cc61002445a0f1e334742f6832e4 from illusionTBA/React-Ruffle..."
  git clone https://github.com/illusionTBA/React-Ruffle.git illusionTBA_React-Ruffle && cd illusionTBA_React-Ruffle && git checkout f37551ff7c55cc61002445a0f1e334742f6832e4 && cd ..
fi

if [ ! -d "jackilyna_framework" ]; then
  echo "Cloning commit edf481486f0511f8bf64cfb7eeee777433da6495 from jackilyna/framework..."
  git clone https://github.com/jackilyna/framework.git jackilyna_framework && cd jackilyna_framework && git checkout edf481486f0511f8bf64cfb7eeee777433da6495 && cd ..
fi

if [ ! -d "jackilyna_lightspark" ]; then
  echo "Cloning commit a0ef15891c7ae753c5d5117af8c919d9af994b1c from jackilyna/lightspark..."
  git clone https://github.com/jackilyna/lightspark.git jackilyna_lightspark && cd jackilyna_lightspark && git checkout a0ef15891c7ae753c5d5117af8c919d9af994b1c && cd ..
fi

if [ ! -d "jackilyna_web-flash" ]; then
  echo "Cloning commit eeca0ee340c64e455095970004dfce5a9c6e791a from jackilyna/web-flash..."
  git clone https://github.com/jackilyna/web-flash.git jackilyna_web-flash && cd jackilyna_web-flash && git checkout eeca0ee340c64e455095970004dfce5a9c6e791a && cd ..
fi

if [ ! -d "lee2sman_everyday" ]; then
  echo "Cloning commit d45d601d2c4d60adf809a0b677c00b7d12aba7e9 from lee2sman/everyday..."
  git clone https://github.com/lee2sman/everyday.git lee2sman_everyday && cd lee2sman_everyday && git checkout d45d601d2c4d60adf809a0b677c00b7d12aba7e9 && cd ..
fi

if [ ! -d "lekug_lekug.github.io" ]; then
  echo "Cloning branch main from lekug/lekug.github.io..."
  git clone --depth 1 --branch main https://github.com/lekug/lekug.github.io.git lekug_lekug.github.io
fi

if [ ! -d "linkd1_g" ]; then
  echo "Cloning commit e079e474647ea113968cdc140ca97380be6409af from linkd1/g..."
  git clone https://github.com/linkd1/g.git linkd1_g && cd linkd1_g && git checkout e079e474647ea113968cdc140ca97380be6409af && cd ..
fi

if [ ! -d "lonya-k_aws" ]; then
  echo "Cloning commit 193add90970804b994d7c2cb1159bf825810a8be from lonya-k/aws..."
  git clone https://github.com/lonya-k/aws.git lonya-k_aws && cd lonya-k_aws && git checkout 193add90970804b994d7c2cb1159bf825810a8be && cd ..
fi

if [ ! -d "lonya-k_aws" ]; then
  echo "Cloning commit 8e4931429a9c08b542c8def752b11a412dfef6b2 from lonya-k/aws..."
  git clone https://github.com/lonya-k/aws.git lonya-k_aws && cd lonya-k_aws && git checkout 8e4931429a9c08b542c8def752b11a412dfef6b2 && cd ..
fi

if [ ! -d "lordsofdank_GetawayShootout" ]; then
  echo "Cloning commit 9e99964c43638346680fce45d3b296408da61181 from lordsofdank/GetawayShootout..."
  git clone https://github.com/lordsofdank/GetawayShootout.git lordsofdank_GetawayShootout && cd lordsofdank_GetawayShootout && git checkout 9e99964c43638346680fce45d3b296408da61181 && cd ..
fi

if [ ! -d "malpig_HTML-Games-V2" ]; then
  echo "Cloning commit c80f20e7b02c5a026c9fede3366477ff7efa628c from malpig/HTML-Games-V2..."
  git clone https://github.com/malpig/HTML-Games-V2.git malpig_HTML-Games-V2 && cd malpig_HTML-Games-V2 && git checkout c80f20e7b02c5a026c9fede3366477ff7efa628c && cd ..
fi

if [ ! -d "markrosenbaum_some-repo" ]; then
  echo "Cloning commit aeb3030a3fb90987658ff4ee1063c64f6206152f from markrosenbaum/some-repo..."
  git clone https://github.com/markrosenbaum/some-repo.git markrosenbaum_some-repo && cd markrosenbaum_some-repo && git checkout aeb3030a3fb90987658ff4ee1063c64f6206152f && cd ..
fi

if [ ! -d "mistirk_google" ]; then
  echo "Cloning commit eebffdf79a14f6e01e153d5cd4bed23c432874fb from mistirk/google..."
  git clone https://github.com/mistirk/google.git mistirk_google && cd mistirk_google && git checkout eebffdf79a14f6e01e153d5cd4bed23c432874fb && cd ..
fi

if [ ! -d "mll-enh_die" ]; then
  echo "Cloning commit fe0e5b08118dacdefc79f2b1427b283be80a9447 from mll-enh/die..."
  git clone https://github.com/mll-enh/die.git mll-enh_die && cd mll-enh_die && git checkout fe0e5b08118dacdefc79f2b1427b283be80a9447 && cd ..
fi

if [ ! -d "mll-enh_diesmosfilehost" ]; then
  echo "Cloning commit 8679c0fe47a99f5657f04958fd06c5abdaa4a6b9 from mll-enh/diesmosfilehost..."
  git clone https://github.com/mll-enh/diesmosfilehost.git mll-enh_diesmosfilehost && cd mll-enh_diesmosfilehost && git checkout 8679c0fe47a99f5657f04958fd06c5abdaa4a6b9 && cd ..
fi

if [ ! -d "mmkgz_flashgames" ]; then
  echo "Cloning commit a776399cb34fbc23911dbd1edca8551de024d611 from mmkgz/flashgames..."
  git clone https://github.com/mmkgz/flashgames.git mmkgz_flashgames && cd mmkgz_flashgames && git checkout a776399cb34fbc23911dbd1edca8551de024d611 && cd ..
fi

if [ ! -d "mogrt1_BCHS" ]; then
  echo "Cloning commit 19fb149c32685a82aed1e66993bf55efc916d5b4 from mogrt1/BCHS..."
  git clone https://github.com/mogrt1/BCHS.git mogrt1_BCHS && cd mogrt1_BCHS && git checkout 19fb149c32685a82aed1e66993bf55efc916d5b4 && cd ..
fi

if [ ! -d "mountain658_BurritoBison" ]; then
  echo "Cloning commit 847c40b3aeee020afd4ffffacb65e36404e5a9de from mountain658/BurritoBison..."
  git clone https://github.com/mountain658/BurritoBison.git mountain658_BurritoBison && cd mountain658_BurritoBison && git checkout 847c40b3aeee020afd4ffffacb65e36404e5a9de && cd ..
fi

if [ ! -d "my-files-schoolum_spi" ]; then
  echo "Cloning branch main from my-files-schoolum/spi..."
  git clone --depth 1 --branch main https://github.com/my-files-schoolum/spi.git my-files-schoolum_spi
fi

if [ ! -d "n-101-1_1" ]; then
  echo "Cloning branch main from n-101-1/1..."
  git clone --depth 1 --branch main https://github.com/n-101-1/1.git n-101-1_1
fi

if [ ! -d "nbjrkzddz_5yrgdegfwfew4" ]; then
  echo "Cloning commit d3772e576f5a2ad716d32ace9c7e5b94f59ded9e from nbjrkzddz/5yrgdegfwfew4..."
  git clone https://github.com/nbjrkzddz/5yrgdegfwfew4.git nbjrkzddz_5yrgdegfwfew4 && cd nbjrkzddz_5yrgdegfwfew4 && git checkout d3772e576f5a2ad716d32ace9c7e5b94f59ded9e && cd ..
fi

if [ ! -d "oldflashgames_games4" ]; then
  echo "Cloning commit 630f33f2ea89cfa120d42a0b3d0bf0b1f9edde8f from oldflashgames/games4..."
  git clone https://github.com/oldflashgames/games4.git oldflashgames_games4 && cd oldflashgames_games4 && git checkout 630f33f2ea89cfa120d42a0b3d0bf0b1f9edde8f && cd ..
fi

if [ ! -d "organig-schools6_99" ]; then
  echo "Cloning branch main from organig-schools6/99..."
  git clone --depth 1 --branch main https://github.com/organig-schools6/99.git organig-schools6_99
fi

if [ ! -d "paigerodeghero_academicwebsite" ]; then
  echo "Cloning commit 897c910c65e6c68b04c44a6b6eba0b99d0f2f2cf from paigerodeghero/academicwebsite..."
  git clone https://github.com/paigerodeghero/academicwebsite.git paigerodeghero_academicwebsite && cd paigerodeghero_academicwebsite && git checkout 897c910c65e6c68b04c44a6b6eba0b99d0f2f2cf && cd ..
fi

if [ ! -d "qollaaa_j" ]; then
  echo "Cloning commit 12a9db02c96fde177dc0e56e1bcc440de5cc3250 from qollaaa/j..."
  git clone https://github.com/qollaaa/j.git qollaaa_j && cd qollaaa_j && git checkout 12a9db02c96fde177dc0e56e1bcc440de5cc3250 && cd ..
fi

if [ ! -d "ranny31ranny_5471" ]; then
  echo "Cloning branch main from ranny31ranny/5471..."
  git clone --depth 1 --branch main https://github.com/ranny31ranny/5471.git ranny31ranny_5471
fi

if [ ! -d "rcmcom_tombofthemask" ]; then
  echo "Cloning branch main from rcmcom/tombofthemask..."
  git clone --depth 1 --branch main https://github.com/rcmcom/tombofthemask.git rcmcom_tombofthemask
fi

if [ ! -d "sasa24s_Sphere-compile" ]; then
  echo "Cloning commit 95d1d98dc38a920d02e6bbcf61620501b2bacfcb from sasa24s/Sphere-compile..."
  git clone https://github.com/sasa24s/Sphere-compile.git sasa24s_Sphere-compile && cd sasa24s_Sphere-compile && git checkout 95d1d98dc38a920d02e6bbcf61620501b2bacfcb && cd ..
fi

if [ ! -d "selenite-cc_selenite-old" ]; then
  echo "Cloning commit 9c743188888af0986c8c7b293dbac8f9e421a4ee from selenite-cc/selenite-old..."
  git clone https://github.com/selenite-cc/selenite-old.git selenite-cc_selenite-old && cd selenite-cc_selenite-old && git checkout 9c743188888af0986c8c7b293dbac8f9e421a4ee && cd ..
fi

if [ ! -d "slqntdevss_StickWithItPort" ]; then
  echo "Cloning branch main from slqntdevss/StickWithItPort..."
  git clone --depth 1 --branch main https://github.com/slqntdevss/StickWithItPort.git slqntdevss_StickWithItPort
fi

if [ ! -d "somer-sheff-73_xv" ]; then
  echo "Cloning branch main from somer-sheff-73/xv..."
  git clone --depth 1 --branch main https://github.com/somer-sheff-73/xv.git somer-sheff-73_xv
fi

if [ ! -d "st39_sdk" ]; then
  echo "Cloning branch main from st39/sdk..."
  git clone --depth 1 --branch main https://github.com/st39/sdk.git st39_sdk
fi

if [ ! -d "supaub_interstellar-3" ]; then
  echo "Cloning commit 8a13c735e7df6d86602b354e45c090405f21f45a from supaub/interstellar-3..."
  git clone https://github.com/supaub/interstellar-3.git supaub_interstellar-3 && cd supaub_interstellar-3 && git checkout 8a13c735e7df6d86602b354e45c090405f21f45a && cd ..
fi

if [ ! -d "testamalame_sef" ]; then
  echo "Cloning branch main from testamalame/sef..."
  git clone --depth 1 --branch main https://github.com/testamalame/sef.git testamalame_sef
fi

if [ ! -d "tty67hlt6jf6_j" ]; then
  echo "Cloning branch main from tty67hlt6jf6/j..."
  git clone --depth 1 --branch main https://github.com/tty67hlt6jf6/j.git tty67hlt6jf6_j
fi

if [ ! -d "u-cvlassrom-y_google" ]; then
  echo "Cloning branch main from u-cvlassrom-y/google..."
  git clone --depth 1 --branch main https://github.com/u-cvlassrom-y/google.git u-cvlassrom-y_google
fi

if [ ! -d "udbsite_adofai" ]; then
  echo "Cloning commit f170efcb1b532312817e69f26ce3f84c99940238 from udbsite/adofai..."
  git clone https://github.com/udbsite/adofai.git udbsite_adofai && cd udbsite_adofai && git checkout f170efcb1b532312817e69f26ce3f84c99940238 && cd ..
fi

if [ ! -d "unxa_unxa.github.io" ]; then
  echo "Cloning commit 976db99398423b4e5a8b327892c2b57b6a5b766f from unxa/unxa.github.io..."
  git clone https://github.com/unxa/unxa.github.io.git unxa_unxa.github.io && cd unxa_unxa.github.io && git checkout 976db99398423b4e5a8b327892c2b57b6a5b766f && cd ..
fi

if [ ! -d "vjspranav_FlashGames" ]; then
  echo "Cloning commit c4afbfe9dd12f23ef93e19d7f3d298105448f349 from vjspranav/FlashGames..."
  git clone https://github.com/vjspranav/FlashGames.git vjspranav_FlashGames && cd vjspranav_FlashGames && git checkout c4afbfe9dd12f23ef93e19d7f3d298105448f349 && cd ..
fi

if [ ! -d "waycrosspublicmedia_fnf-mods" ]; then
  echo "Cloning commit 6b6680f79ab8c4e8349a920c2a240c5e7ee689ea from waycrosspublicmedia/fnf-mods..."
  git clone https://github.com/waycrosspublicmedia/fnf-mods.git waycrosspublicmedia_fnf-mods && cd waycrosspublicmedia_fnf-mods && git checkout 6b6680f79ab8c4e8349a920c2a240c5e7ee689ea && cd ..
fi

if [ ! -d "waycrosspublicmedia_fnf" ]; then
  echo "Cloning commit 00d21c48bb912e5b6b3373ca21c793c135aae5d8 from waycrosspublicmedia/fnf..."
  git clone https://github.com/waycrosspublicmedia/fnf.git waycrosspublicmedia_fnf && cd waycrosspublicmedia_fnf && git checkout 00d21c48bb912e5b6b3373ca21c793c135aae5d8 && cd ..
fi

if [ ! -d "waycrosspublicmedia_maths" ]; then
  echo "Cloning commit 19a7910572966b9604b81bf6e9b85cacacc785ab from waycrosspublicmedia/maths..."
  git clone https://github.com/waycrosspublicmedia/maths.git waycrosspublicmedia_maths && cd waycrosspublicmedia_maths && git checkout 19a7910572966b9604b81bf6e9b85cacacc785ab && cd ..
fi

if [ ! -d "web-ports_cuphead" ]; then
  echo "Cloning branch main from web-ports/cuphead..."
  git clone --depth 1 --branch main https://github.com/web-ports/cuphead.git web-ports_cuphead
fi

if [ ! -d "web-ports_hollow-knight" ]; then
  echo "Cloning branch latest from web-ports/hollow-knight..."
  git clone --depth 1 --branch latest https://github.com/web-ports/hollow-knight.git web-ports_hollow-knight
fi

if [ ! -d "web-ports_slime-ranchers" ]; then
  echo "Cloning branch main from web-ports/slime-ranchers..."
  git clone --depth 1 --branch main https://github.com/web-ports/slime-ranchers.git web-ports_slime-ranchers
fi

if [ ! -d "yrgen73_12" ]; then
  echo "Cloning commit 250ba40ef0fed9b3106d4a2af96e463b819f54ef from yrgen73/12..."
  git clone https://github.com/yrgen73/12.git yrgen73_12 && cd yrgen73_12 && git checkout 250ba40ef0fed9b3106d4a2af96e463b819f54ef && cd ..
fi

if [ ! -d "yrgen73_12" ]; then
  echo "Cloning commit 5043038783e6ce235c297b1a5b2982a643bea713 from yrgen73/12..."
  git clone https://github.com/yrgen73/12.git yrgen73_12 && cd yrgen73_12 && git checkout 5043038783e6ce235c297b1a5b2982a643bea713 && cd ..
fi

if [ ! -d "yrgen73_Jtrigger" ]; then
  echo "Cloning commit 026d22a3c5e67a8df14227c019dab86e8df507f3 from yrgen73/Jtrigger..."
  git clone https://github.com/yrgen73/Jtrigger.git yrgen73_Jtrigger && cd yrgen73_Jtrigger && git checkout 026d22a3c5e67a8df14227c019dab86e8df507f3 && cd ..
fi

if [ ! -d "yrgen73_Jtrigger" ]; then
  echo "Cloning commit 050cca2d3bdad0e560f178b63ea2248198dff907 from yrgen73/Jtrigger..."
  git clone https://github.com/yrgen73/Jtrigger.git yrgen73_Jtrigger && cd yrgen73_Jtrigger && git checkout 050cca2d3bdad0e560f178b63ea2248198dff907 && cd ..
fi

if [ ! -d "yrgen73_Jtrigger" ]; then
  echo "Cloning commit 462c576ba6026ba828c675859c838ed3d966fc66 from yrgen73/Jtrigger..."
  git clone https://github.com/yrgen73/Jtrigger.git yrgen73_Jtrigger && cd yrgen73_Jtrigger && git checkout 462c576ba6026ba828c675859c838ed3d966fc66 && cd ..
fi

if [ ! -d "yrgen73_Jtrigger" ]; then
  echo "Cloning commit 858a22f47db1fabd07d6ac0707df0173b92a9052 from yrgen73/Jtrigger..."
  git clone https://github.com/yrgen73/Jtrigger.git yrgen73_Jtrigger && cd yrgen73_Jtrigger && git checkout 858a22f47db1fabd07d6ac0707df0173b92a9052 && cd ..
fi

if [ ! -d "yrgen73_draw-cl" ]; then
  echo "Cloning commit 5cebc8634ca87bab6a76bf0ce2ef0fb99fa2548c from yrgen73/draw-cl..."
  git clone https://github.com/yrgen73/draw-cl.git yrgen73_draw-cl && cd yrgen73_draw-cl && git checkout 5cebc8634ca87bab6a76bf0ce2ef0fb99fa2548c && cd ..
fi

if [ ! -d "yrgen73_draw-cl" ]; then
  echo "Cloning commit 8733508d84acdb41f47f102753e570de9f0a9971 from yrgen73/draw-cl..."
  git clone https://github.com/yrgen73/draw-cl.git yrgen73_draw-cl && cd yrgen73_draw-cl && git checkout 8733508d84acdb41f47f102753e570de9f0a9971 && cd ..
fi

if [ ! -d "yrgen73_mineSW" ]; then
  echo "Cloning commit 24b48ecbfb5331be54fca85c1bf743389ce3195b from yrgen73/mineSW..."
  git clone https://github.com/yrgen73/mineSW.git yrgen73_mineSW && cd yrgen73_mineSW && git checkout 24b48ecbfb5331be54fca85c1bf743389ce3195b && cd ..
fi

echo "✅ All repos cloned into ./assets"