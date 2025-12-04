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

package google.sdv.gateway.data_tunnel;

import android.hardware.common.NativeHandle;
import android.hardware.common.fmq.MQDescriptor;
import android.hardware.common.fmq.UnsynchronizedWrite;

/**
 * Contains all the required Data Tunnel topic information
 * including name, internal id, message size, message count,
 * and FMQ descriptor.
 *
 * Note: not the final API.
 */
@VintfStability
parcelable PublicationDescriptor {
    /* For internal DataTunnel Agent use only */
    int publicationId;
    /* Stores the Publication's message size in bytes */
    int messageSizeBytes;
    /* Stores the Publication's buffer size in number of messages */
    int messageCount;
    /* Holds the Publication's FMQ descriptor */
    MQDescriptor<byte, UnsynchronizedWrite> mqDesc;
}
