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

package google.sdv.someip_load_indicators;

@RustDerive(Clone=true, PartialEq=true, Eq=true)
@VintfStability
/**
 * Represents the current load indicators of the Broker.
 * This Parcelable provides insights into the processing status of received events.
 */
parcelable LoadIndicators {
    /**
      Value that reflects current load of the Broker.
      It's a count of received SOME/IP events that have not yet been processed by the broker.
      - Value 0 corresponds to zero load, with 0 messages that are pending in the queue.
      - Positive values indicate that there are pending messages to be processed.
      - Negative values should not occur. If a negative value is received, it should be treated as
      an error.
    */
    int pendingSomeIpEventCounter;
}
