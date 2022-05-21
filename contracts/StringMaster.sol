// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract StringMaster {
  function length(string memory str) pure public returns(uint) {
    bytes memory strBytes = bytes(str);
    return strBytes.length;
  }

  function concatenate(string memory string1, string memory string2) pure public returns(string memory) {
    bytes memory str1Bytes = bytes(string1);
    bytes memory str2Bytes = bytes(string2);
    string memory str = new string(str1Bytes.length + str2Bytes.length);
    bytes memory strBytes = bytes(str);

    uint j = 0;
    for(uint i = 0; i < str1Bytes.length; i++) {
      strBytes[j] = str1Bytes[i];
      j++;
    }
    for(uint i = 0; i < str2Bytes.length; i++) {
      strBytes[j] = str2Bytes[i];
      j++;
    }

    return string(strBytes);
  }
}
