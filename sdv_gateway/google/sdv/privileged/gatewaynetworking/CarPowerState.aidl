//
// Copyright (C) 2026 The Android Open Source Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

package google.sdv.privileged.gatewaynetworking;

/**
 * Representation of power states, matching those defined in CarPowerManager.
 *
 * Note: We have this file since android.frameworks.automotive.power.ICarPowerServer
 * is not available until A16, see b/418004379 for more contexts.
 *
 * @deprecated Gateway networking API will be internal in the future.
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