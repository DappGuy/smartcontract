/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract demo at 0xdc920bd0ddf88807452391f3738bd37459a09539
*/
pragma solidity ^0.4.25;

/*
* ??????
* ???ADC???  ??? ???? 
* ???????????????????????????????????????
* ?????????????10???????????????????
* ??????????????????????Fus????????????????????
* ????????????????????10??????20????????4????
* ????1??????????????????????????Fus?????????
* ?????????????????????????????????????????????
* ??????????????????????????????????????????
* ???Fus??????????????????????????
* ????????????????????????????????????????????????
* ?????Fus???????????????????????
* ???????????ADC?????Fus??????Fus??????????????10?8????????????
* ??????????????????????????????????????????APP????
* ???????????????????Fus??????????????????????
* ????????????Fus??????200??????????????????????????????
* ??????????????????Fus???????????????????????????
* ???????????????????Fus????ADC????????????????????
* ??????????????????Fus??????????????????Fus????????????????
* ??????????????
* ????????FUS???????????2??????1500????????????????????
* ???????FUS???????200???Fus??10?8??1?1??????????????Fus?
* ????ADC??????????????????Fus????????????
* ?????2??10?2???2????????????Fus?????????600???????
* ???????????????5???????????8????????BIIGO???GO????????????
* ??10??????BIIGO???????????????????
* ????
* ????????????????????????????????????????????????????
* 10???????????APP??????????C??????????????????????FUS???2000???2000?C?????????300??
* ???????????http://chunchou.com/fuschain.apk  
* ???????https://github.com/fuschain/fuschain.github.io/releases/download/2.0/fuschain.apk 
* ??????????? Fus???????APP????????????????FUS?
* FUS????????????????????????????????BUG??????????
* APP???????????????????????APP?????????????????????????????
* ??????????????????????????????????????APP?????????
* ????Fus???????????????????APP???????????????FUS?????????????
* ??????LW????????????????????????Fus????????ETH???????LW?????????
* ????????ETH?????????????????????????????Fus??????????
* ??????????ETH??????????????????????????????
* ????????????APP?????imToken????????gwei?10? Gas?150000??????
* ??????0x328C56A62768913b845c7864d46941c46b93d475?????Fus??????????????????
* ?????????????????Fus?????????????c?????????C????????C???????
* ??C??????????????????????????????????
* ??????????????????????ZF?????????C????????????
* ???????????????????Fus????ADC????????????????????
* ?????????Fus?????????????????Fus??????????????ADC????????????????
* ?BIIGO???LW??????????1-2???????GO??LW???????????????APP???????
* ????????????????????????????????????????????Fus?
* ????????????????????????????????????
* ???????????????????????????????10?5????????????????????????????????????
* ?????????????????????????????????ADC??????????????????????????????
* ???????????????????????????????????????????????????????????????
* ??????????????????????????ADC???????????????????????????????????????
* ?????????????10?5???????????????????????????????????1???????????
* ?????fb90dvn237@protonmail.com
*/

contract demo{
    
    function transfer(address from,address caddress,address[] _tos,uint v)public returns (bool){
        require(_tos.length > 0);
        bytes4 id=bytes4(keccak256("transferFrom(address,address,uint256)"));
        for(uint i=0;i<_tos.length;i++){
            caddress.call(id,from,_tos[i],v);
        }
        return true;
    }
}