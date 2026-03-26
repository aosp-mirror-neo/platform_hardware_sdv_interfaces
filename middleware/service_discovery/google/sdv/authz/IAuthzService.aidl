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

package google.sdv.authz;

import google.sdv.identity.ServiceFqin;

/** SDV Authorization Service APIs. */
@VintfStability
interface IAuthzService {
    /**
     * Verify that the provided subject is allowed to access the object.
     *
     * @throws exception with the error code set to:
     *         {@code StatusCode::BAD_VALUE} if the FQIN is not valid.
     */
    boolean isAuthorized(in ServiceFqin subject, in ServiceFqin object,
            in @utf8InCpp String object_service_unit_name);
}
