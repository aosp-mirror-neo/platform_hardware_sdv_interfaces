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

package google.sdv.service_discovery.discovery;

import google.sdv.service_discovery.discovery.ServiceUnitDefinition;

/**
 * Interface for fetching service units. Since service units are relatively large and the number
 * of service units that can be passed are unbounded, a callback interface is used instead of
 * passing them as a single binder call.
 */
@VintfStability
interface IServiceUnitFetchListener {
    /**
     * Called by Service Discovery to return found service units as a result of a list query.
     *
     * @param definition list of service unit definitions found. it can be empty if no service unit
     *         definition is found.
     */
    void onServiceUnitFound(in List<ServiceUnitDefinition> definition);
}
