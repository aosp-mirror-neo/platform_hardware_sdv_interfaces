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

import google.sdv.vpm.IPowerStateReportListener;
import google.sdv.vpm.PowerStateReport;

/* Interface for the VPM client.
 * This interface allows the clients to subscribe to the power state reports. */
@VintfStability
interface IPowerStateClientApi {
    /**
     * Subscribe to the power state updates.
     * @param[in] IPowerStateListener the callback interface for the power state listener.
     * @return PowerStateReport the current power state report.
     */
    PowerStateReport subscribeToPowerStateReport(IPowerStateReportListener listener);
}
