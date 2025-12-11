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

#include <sdv/callback.h>

// Forward declaration of structs required for compiling the callback
// vtables below. See unit_discovery.h for complete definition and documentation.
typedef struct ASDV_ServiceUnitDefinition ASDV_ServiceUnitDefinition;
typedef struct ASDV_ServiceUnitChangeEvent ASDV_ServiceUnitChangeEvent;
typedef struct ASDV_ServiceUnitChangeListenerHandle ASDV_ServiceUnitChangeListenerHandle;

/*
 * Declare a Callback for the function ASDV_ServiceDiscoveryManager_listUnitsByType. The generated
 * type is ASDV_CallbackVTable_ServiceDiscoveryManager_ListUnitsByType.
 */
DEFINE_CALLBACK(ServiceDiscoveryManager_ListUnitsByType, ASDV_ServiceUnitDefinition* _Nullable);

/*
 * Declare a Callback for the function ASDV_ServiceDiscoveryManager_listUnitsByName. The generated
 * type is ASDV_CallbackVTable_ServiceDiscoveryManager_ListUnitsByName.
 */
DEFINE_CALLBACK(ServiceDiscoveryManager_ListUnitsByName, ASDV_ServiceUnitDefinition* _Nullable);

/*
 * Declare a Callback for the function ASDV_ServiceDiscoveryManager_getUnit. The generated type is
 * ASDV_CallbackVTable_ServiceDiscoveryManager_GetUnit.
 */
DEFINE_ONCE_CALLBACK(ServiceDiscoveryManager_GetUnit, ASDV_ServiceUnitDefinition* _Nonnull);

/*
 * Declare a Callback for the functions
 * ASDV_ServiceDiscoveryManager_registerServiceUnitChangeListener[Name|Type]. The generated type is
 * ASDV_CallbackVTable_ServiceDiscoveryManager_RegisterServiceUnitChangeListener.
 */
DEFINE_ONCE_CALLBACK(ServiceDiscoveryManager_RegisterServiceUnitChangeListener,
                     ASDV_ServiceUnitChangeListenerHandle* _Nonnull);

/*
 * Declare a Callback for the callback argument of the functions
 * ASDV_ServiceDiscoveryManager_registerServiceUnitChangeListenerBy[Name|Type]. The generated type
 * is ASDV_CallbackVTable_ServiceDiscoveryManager_NotifyListenerOfServiceUnitChange.
 */
DEFINE_CALLBACK(ServiceDiscoveryManager_NotifyListenerOfServiceUnitChange,
                ASDV_ServiceUnitChangeEvent* _Nonnull);
