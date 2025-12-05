//
// Copyright (C) 2025 The Android Open Source Project
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

package google.sdv.vpm;

import google.sdv.vpm.PowerStateReport;

/* Callback interface for power state machine updates.
 *
 * The VPM will wait on the execution of onPowerStateReportChanged method.
 *
 * Critical changes caused by power state changes should be executed before the return on this
 * callback.
 *
 * The VPM will have a timeout for the callback execution.
 *
 * Subsequent callbacks can be received sequentially, the client should cancel/interrupt the older
 * callbacks and execute the more recent one.
 */
@VintfStability
interface IPowerStateReportListener {
    /**
     * Callback method when the power state report has changed.
     * @param[in] PowerStateReport the new power state report.
     */
    void onPowerStateReportChanged(PowerStateReport PowerStateReport);
}
