// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.8.4;

contract DStorage {
  string public name = "DStorage";
  uint public fileCount = 0;
  // Number of files
  // Mapping fileId=>Struct 
  mapping(uint => File) public files;

  // Struct
  struct File{
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address uploader;
  }

  // Event
  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address uploader
  );

  constructor() public {
  }

  // Upload File function
  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, string memory _fileDescription) public{
    // Make sure the file hash exists
    require(bytes(_fileHash).length > 0);

    // Make sure file size is more than 0
    require(_fileSize > 0);

    // Make sure file type exists
    require(bytes(_fileType).length > 0);

    // Make sure file fileName exists
    require(bytes(_fileName).length > 0);

    // Make sure file description exists
    require(bytes(_fileDescription).length > 0);

    // Make sure uploader address exists
    require(msg.sender != address(0));

    // Increment file id
    fileCount++;
    // Add File to the contract
    files[fileCount] = File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, block.timestamp, msg.sender);

    // Trigger an event
    emit FileUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, block.timestamp, msg.sender);
  }

}