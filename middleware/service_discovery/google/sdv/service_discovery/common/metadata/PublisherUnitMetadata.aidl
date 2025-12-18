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

/** Standardised metadata about a Publisher Unit registered with Service Discovery. */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable PublisherUnitMetadata {
    int version; // unsigned 32 bits
    int message_size;
    int message_count;
    /**
     * The name of the channel this publisher will send message to.
     * This is a kebab-case string with length limited by 127 chars,
     * containing the following chars: [a-z0-9-].
     * Empty channels are not valid channels.
     *
     * Valid: "channel-name", "name"
     * Invalid: "", "-channel-", "-", "CHANNEL", "channel_name"
     */
    @utf8InCpp String channel_name = "";
}
