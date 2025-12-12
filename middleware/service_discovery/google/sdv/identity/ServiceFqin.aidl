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

package google.sdv.identity;

/**
 * Describes the Service Fully Qualified Name (FQIN) that is used to identify a single runtime
 * instance of a Service Bundle.
 *
 * FQIN is the name of a particular Service Instance that may be deployed on AAOS SDV.
 * It combines all the necessary names: VM Name, Package Name, Service Name, and
 * Instance Name, into a single identifier.
 */
@RustDerive(Clone=true, PartialEq=true, Eq=true, Hash=true)
@VintfStability
parcelable ServiceFqin {
    /** The SDV VM Instance on which this Service Bundle is registered. */
    @utf8InCpp String sdvVmName;

    /** The name of the SDV Package Name within which this Service Bundle was deployed. */
    @utf8InCpp String sdvPackageName;

    /** The Service Bundle Name as declared in the Package's Manifest. */
    @utf8InCpp String serviceBundleName;

    /**
     * The Service Instance Name as assigned by the Orchestrator when the Service Bundle was
     * loaded.
     */
    @utf8InCpp String serviceInstanceName;
}
