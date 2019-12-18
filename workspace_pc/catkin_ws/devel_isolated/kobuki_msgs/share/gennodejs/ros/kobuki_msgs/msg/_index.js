
"use strict";

let SensorState = require('./SensorState.js');
let WheelDropEvent = require('./WheelDropEvent.js');
let Sound = require('./Sound.js');
let DigitalOutput = require('./DigitalOutput.js');
let PowerSystemEvent = require('./PowerSystemEvent.js');
let MotorPower = require('./MotorPower.js');
let BumperEvent = require('./BumperEvent.js');
let VersionInfo = require('./VersionInfo.js');
let ControllerInfo = require('./ControllerInfo.js');
let ExternalPower = require('./ExternalPower.js');
let ButtonEvent = require('./ButtonEvent.js');
let KeyboardInput = require('./KeyboardInput.js');
let DigitalInputEvent = require('./DigitalInputEvent.js');
let ScanAngle = require('./ScanAngle.js');
let RobotStateEvent = require('./RobotStateEvent.js');
let CliffEvent = require('./CliffEvent.js');
let DockInfraRed = require('./DockInfraRed.js');
let Led = require('./Led.js');
let AutoDockingActionResult = require('./AutoDockingActionResult.js');
let AutoDockingActionGoal = require('./AutoDockingActionGoal.js');
let AutoDockingActionFeedback = require('./AutoDockingActionFeedback.js');
let AutoDockingResult = require('./AutoDockingResult.js');
let AutoDockingAction = require('./AutoDockingAction.js');
let AutoDockingFeedback = require('./AutoDockingFeedback.js');
let AutoDockingGoal = require('./AutoDockingGoal.js');

module.exports = {
  SensorState: SensorState,
  WheelDropEvent: WheelDropEvent,
  Sound: Sound,
  DigitalOutput: DigitalOutput,
  PowerSystemEvent: PowerSystemEvent,
  MotorPower: MotorPower,
  BumperEvent: BumperEvent,
  VersionInfo: VersionInfo,
  ControllerInfo: ControllerInfo,
  ExternalPower: ExternalPower,
  ButtonEvent: ButtonEvent,
  KeyboardInput: KeyboardInput,
  DigitalInputEvent: DigitalInputEvent,
  ScanAngle: ScanAngle,
  RobotStateEvent: RobotStateEvent,
  CliffEvent: CliffEvent,
  DockInfraRed: DockInfraRed,
  Led: Led,
  AutoDockingActionResult: AutoDockingActionResult,
  AutoDockingActionGoal: AutoDockingActionGoal,
  AutoDockingActionFeedback: AutoDockingActionFeedback,
  AutoDockingResult: AutoDockingResult,
  AutoDockingAction: AutoDockingAction,
  AutoDockingFeedback: AutoDockingFeedback,
  AutoDockingGoal: AutoDockingGoal,
};
