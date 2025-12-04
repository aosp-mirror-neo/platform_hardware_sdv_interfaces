//
// Copyright (C) 2023 The Android Open Source Project
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

package google.sdv.lifecycle.internal;

/**
 * Service is a high-level abstraction for SDV application execution.
 * Service provides the basic lifecycle notifications for starting and
 * stopping the dynamic activities.
 *
 * **Common Error conditions**
 * - `ResponseCode::PERMISSION_DENIED` - if the callers do not have permission.
 * - `ResponseCode::INTERNAL_ERROR` - something internal failed, info in the error msg.
 */
@VintfStability
interface IService {
    /**
     * Constructs the service object.
     *
     * This notification mimics the native code constructor and guarantees to be called once.
     * For more information please follow `sdv::Service::Service()` constructor.
     *
     * **Error conditions**
     * - `ResponseCode::OPERATION_FAILED` - if the service could not be created.
     */
    void onCreate();

    /**
     * Notifies the service about the start phase.
     *
     * For more information please follow `sdv::Service::onStart()` method.
     *
     * **Error conditions**
     * - `ResponseCode::OPERATION_FAILED` - if the service could not start.
     */
    void onStart();

    /**
     * Notifies the service about the stop phase.
     *
     * For more information please follow `sdv::Service::onStop()` method.
     *
     * **Error conditions**
     * - `ResponseCode::OPERATION_FAILED` - if the service could not stop.
     */
    void onStop();

    /**
     * Destructs the service.
     *
     * This notification mimics the native code destructor and guarantees to be called once.
     * For more information please follow `sdv::Service::~Service()` destructor.
     *
     * **Error conditions**
     * - `ResponseCode::OPERATION_FAILED` - if the service could not be destructed.
     */
    void onDestroy();
}
