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

#pragma once

#include "sdv/service_fqin.h"
#include "sdv/service_identity.h"

#include <sdv/status.h>

#ifdef __cplusplus
extern "C" {
#endif

/// Privileged API.
/// Waits (and blocks current thread) for SDV Comms Agents to be available, or start them if any
/// is configured as a dynamic service and isn't yet started.
sdv_status_t ASDV_Context_waitForAgents();

// Represents the SDV SDK Context of the Service Bundle.
//
// Design Notes:
// * The Context object is the single entry point into SDV Comms SDK APIs.
// * Each Context Object is tied to the Service Bundle for which it was created and initialized,
//   and should NOT be passed outside the owning Service Bundle.
// * Each Service Bundle receives its instance of the Context Object through Lifecycle Manager.
typedef struct ASDV_Context ASDV_Context;

// Temporary fake factory function.
// Will be removed once migration to SDV LifecycleManager is completed.
const ASDV_Context* _Nonnull ASDV_Context_temporaryCreate(const ASDV_ServiceFqin* _Nonnull fqin);

/// Fetches the Identity of the process which is associated with Context object.
///
/// # Safety
/// The caller is responsible for creating managing the lifetime of the ASDV_ServiceIdentity
/// object. The caller is additionally responsible for ensuring that ctx is a valid pointer to an
/// ASDV_Context instance.
sdv_status_t ASDV_Context_getSelfIdentity(const ASDV_Context* _Nonnull ctx,
                                          /* out */ ASDV_ServiceIdentity* _Nonnull identity);

/// Fetches the Fully Qualified Name of the process which is associated with Context object.
///
/// # Safety
/// The caller is responsible for creating managing the lifetime of the ASDV_ServiceFqin
/// object. The caller is additionally responsible for ensuring that ctx is a valid pointer to an
/// ASDV_Context instance.
sdv_status_t ASDV_Context_getSelfFqin(const ASDV_Context* _Nonnull ctx,
                                      /* out */ ASDV_ServiceFqin* _Nonnull fqin);

#ifdef __cplusplus
}
#endif
