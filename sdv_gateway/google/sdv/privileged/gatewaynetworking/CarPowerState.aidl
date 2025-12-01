// Copyright 2025 Google LLC

package google.sdv.privileged.gatewaynetworking;

/**
 * Representation of power states, matching those defined in CarPowerManager.
 *
 * Note: We have this file since android.frameworks.automotive.power.ICarPowerServer
 * is not available until A16, see b/418004379 for more contexts.
 */

@Backing(type="int") @VintfStability
enum CarPowerState {
  INVALID = 0,
  WAIT_FOR_VHAL = 1,
  SUSPEND_ENTER = 2,
  SUSPEND_EXIT = 3,
  SHUTDOWN_ENTER = 5,
  ON = 6,
  SHUTDOWN_PREPARE = 7,
  SHUTDOWN_CANCELLED = 8,
  HIBERNATION_ENTER = 9,
  HIBERNATION_EXIT = 10,
  PRE_SHUTDOWN_PREPARE = 11,
  POST_SUSPEND_ENTER = 12,
  POST_SHUTDOWN_ENTER = 13,
  POST_HIBERNATION_ENTER = 14,
}