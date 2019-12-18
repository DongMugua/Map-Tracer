// Auto-generated. Do not edit!

// (in-package yocs_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DockingInteractorGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
      this.distance = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DockingInteractorGoal
    // Serialize message field [command]
    bufferOffset = _serializer.int8(obj.command, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float32(obj.distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DockingInteractorGoal
    let len;
    let data = new DockingInteractorGoal(null);
    // Deserialize message field [command]
    data.command = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yocs_msgs/DockingInteractorGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a1563535e153244b1a7418f3bdd821d8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Request
    int8 command
    float32 distance
    
    int8 WAKE_UP= 10
    int8 REGISTER_DOCK_IN_GLOBAL_FRAME = 20
    int8 RETURN_TO_DOCK = 30
    int8 GOTO_DOCK_FRONT = 40
    int8 CALL_AUTODOCK = 50
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DockingInteractorGoal(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    return resolved;
    }
};

// Constants for message
DockingInteractorGoal.Constants = {
  WAKE_UP: 10,
  REGISTER_DOCK_IN_GLOBAL_FRAME: 20,
  RETURN_TO_DOCK: 30,
  GOTO_DOCK_FRONT: 40,
  CALL_AUTODOCK: 50,
}

module.exports = DockingInteractorGoal;