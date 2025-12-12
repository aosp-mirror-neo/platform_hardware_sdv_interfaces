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

#include "sdv/status.h"

#ifdef __cplusplus
extern "C" {
#endif

// LINT.IfChange(callback_vtable_docs)
// Declares a Callback type that can be used across stable C ABI layer.
// This includes a callback function `func`, a `clear` function and some `cb_data` pointer for
// invoking the two functions. All the pointers here are owned by the Callback struct and are
// released automatically when the Callback object is dropped.
//
// # SAFETY
// - `func` will be legal to call on the provided `cb_data` and any `T` an arbitrary number of
//   times so long as `clear` has not been called on `cb_data`.
// - `clear` may be called on `cb_data` at most once. After `clear` has been called using
//   `cb_data`, calling `func` on the same `cb_data` is undefined behaviour.
// - `func` and `clear` must be callable on any thread, though the user may assume that they
//   are not in use on multiple threads at the same time.
// LINT.ThenChange(/system/software_defined_vehicle/middleware/sdv_comms/common/src/callback/ffi.rs:callback_vtable_docs)
// LINT.IfChange(callback_vtable)
#define DEFINE_CALLBACK(name, value_type)                                       \
    typedef struct {                                                            \
        sdv_status_t (*_Nonnull func)(void* _Nullable cb_data, value_type val); \
        void (*_Nonnull clear)(void* _Nullable cb_data);                        \
        void* _Nullable cb_data;                                                \
    } ASDV_CallbackVTable_##name;
// LINT.ThenChange(/system/software_defined_vehicle/middleware/sdv_comms/common/src/callback/ffi.rs:callback_vtable)

// LINT.IfChange(once_callback_vtable_docs)
// Declares a Callback type that can be used across stable C ABI layer.
// This includes a callback function `func`, a `clear` function and some `cb_data` pointer for
// invoking the two functions. All the pointers here are owned by the Callback struct and are
// released automatically when the Callback object is dropped.
//
// # SAFETY
// - `func` may be called on `cb_data` and any `T` at most once. After `func` has been called
//   using `cb_data` calling `clear` on the same `cb_data` is undefined behaviour.
// - `clear` may be called on `cb_data` at most once. After `clear` has been called using
//   `cb_data`, calling `func` on the same `cb_data` is undefined behaviour.
// - `func` and `clear` must be callable on any thread, though the user may assume that they
//   are not in use on multiple threads at the same time.
// LINT.ThenChange(/system/software_defined_vehicle/middleware/sdv_comms/common/src/callback/ffi.rs:once_callback_vtable_docs)
// LINT.IfChange(once_callback_vtable)
#define DEFINE_ONCE_CALLBACK(name, value_type)                                               \
    typedef struct {                                                                         \
        void (*_Nonnull func)(void* _Nullable cb_data, value_type val, sdv_status_t status); \
        void (*_Nonnull clear)(void* _Nullable cb_data);                                     \
        void* _Nullable cb_data;                                                             \
    } ASDV_CallbackVTable_##name;
// LINT.ThenChange(/system/software_defined_vehicle/middleware/sdv_comms/common/src/callback/ffi.rs:once_callback_vtable)

#ifdef __cplusplus
}  // extern "C"
#endif
