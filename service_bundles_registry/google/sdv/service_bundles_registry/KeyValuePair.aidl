//
// Copyright (C) 2024 The Android Open Source Project
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

// This API intends to be used by other SDV Agents.
// Using google package allows make the interface VINTF stable and be used from APEXes.
package google.sdv.service_bundles_registry;

/**
 * Pair of String-to-String values to be stored in service bundle metadata.
 */
@RustDerive(Clone=true, PartialEq=true, Eq=true)
@VintfStability
parcelable KeyValuePair {
    @utf8InCpp String key;
    @utf8InCpp String value;
}
