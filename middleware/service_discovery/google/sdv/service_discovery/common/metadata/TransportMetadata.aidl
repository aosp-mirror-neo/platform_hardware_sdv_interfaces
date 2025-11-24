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

package google.sdv.service_discovery.common.metadata;

/**
 * Metadata defined by Transport Agents.
 *
 * This Metadata value is filled by Transport Agents when completing Service Unit registration.
 *
 * We cannot use ParcelableHolder as IPC ParcelableHolder cannot pass to RPC ParcelableHolder
 * see b/182939048
 */
@RustDerive(Clone=true)
@VintfStability
parcelable TransportMetadata {
    byte[] value_holder;
}
