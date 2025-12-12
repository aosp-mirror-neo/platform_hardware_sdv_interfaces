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

/**
 * Query the Service Discovery APIs for Service Units by specifying the SdvPackageName and
 * ServiceBundleName.
 *
 * The UnitName, and SdvVmName are optional parameters that may
 * or may not be specified to restrict the scope of the results.
 */
@RustDerive(Clone=true, PartialEq=true, Eq=true, Hash=true)
@VintfStability
parcelable UnitNameParameters {
    /** Optional. The name of the SDV VM on which identified Service Units are registered. */
    @nullable @utf8InCpp String sdvVmName;

    /**
     * Required. The name of the SDV Package within which the identified Service Units (and
     * containing Bundle) were deployed.
     */
    @utf8InCpp String sdvPackageName;

    /** Required. The name of Service Bundle which registered the identified Service Units. */
    @utf8InCpp String serviceBundleName;

    /** Optional. The name of Service Unit which was used during registration. */
    @nullable @utf8InCpp String unitName;
}
