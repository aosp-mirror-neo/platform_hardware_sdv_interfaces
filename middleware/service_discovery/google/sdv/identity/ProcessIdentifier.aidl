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

package google.sdv.identity;

/**
 * Unique process identifier composed from OS-specific identifiers.
 *
 * In contrast with single PID that can be reused after process death add
 * UID that may be shared across multiple processes started by the same user this identifier
 * expected to provide stronger guaranties of uniquness in production and test.
 */
@RustDerive(Clone=true, PartialEq=true, Eq=true, Hash=true)
@VintfStability
parcelable ProcessIdentifier {
    /** Android process identifier */
    long pid;

    /** Android user identifier */
    long uid;
}
