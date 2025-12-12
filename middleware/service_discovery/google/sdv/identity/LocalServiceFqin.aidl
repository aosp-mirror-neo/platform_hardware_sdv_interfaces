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
 * Describes VM-independent elements of a Service Bundle identity.
 * Contains all elements from the Fully Qualified Name (FQIN) except the sdvVmName. See
 * google.sdv.identity.ServiceFqin.
 */
@VintfStability
@RustDerive(Clone=true, PartialEq=true, Eq=true, Hash=true)
parcelable LocalServiceFqin {
    /** The SDV Package Name within which this Service Bundle was deployed. */
    @utf8InCpp String sdvPackageName;

    /**
     * The Service Bundle Name as declared in the Package's Manifest for Service Bundles, or self
     * assigned in the case of native services on SDV Core and IVI and Java Apps on IVI.
     */
    @utf8InCpp String serviceBundleName;

    /**
     * The Service Instance Name. For Service Bundles, this is assigned by the Orchestrator
     * when the Service Bundle was launched (on SDV Core), or specified by the service (on IVI).
     */
    @utf8InCpp String serviceInstanceName;
}
