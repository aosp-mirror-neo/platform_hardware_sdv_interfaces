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

package google.sdv.someip;

import google.sdv.someip.SomeIpService;

/**
 * Callback interface to notify about SOME/IP events.
 */
@VintfStability
oneway interface IEventNotificationCallback {
    /**
     * Notifies about incoming SOME/IP event.
     *
     * Notification contains publisher service, instance and event IDs, and raw payload in SOME/IP
     * wire format.
     *
     * @param[in] service The service that published the event.
     * @param[in] event_id The event ID.
     * @param[in] payload The raw event payload in SOME/IP wire format.
     */
    void onEvent(in SomeIpService service, char event_id, in byte[] payload);
}
