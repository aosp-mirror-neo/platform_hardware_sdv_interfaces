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

package google.sdv.telemetry.configurable_publisher;

/**
 * Describes a configurable publisher
 */

@VintfStability
parcelable PublisherInfo {
    // Name of the publisher service. Must be unique across all publishers
    // across SDV. Must be non-null
    @utf8InCpp String serviceName;

    // @deprecated Use `fileDescriptorSet` instead and set this to `null`.
    //
    // Serialized `google.protobuf.FileDescriptorProto` that contains the
    // message descriptor (named by the `messageTypeName` field) of the message
    // this publisher publishes and all of its necessary dependencies.
    //
    // The message descriptor is used by the telemetry service to deserialize
    // the data sent by the publisher.
    //
    // Only one of `fileDescriptorProto` and `fileDescriptorSet` may be set
    // (= non-null). An empty byte array is treated as being set, since an empty
    // byte array is a valid serialization result of a protobuf message.
    //
    // `fileDescriptorProto` must be less than 10Kb to prevent binder buffer to
    // be full.
    @nullable byte[] fileDescriptorProto;

    // Full name of the published message. Must be non-null. The message
    // descriptor of this message must be declared in `fileDescriptorProto` or
    // `fileDescriptorSet`.
    @utf8InCpp String messageTypeName;

    // Indicates whether the publisher provides latest message without
    // subscribing.
    boolean supportsGet;

    // Serialized `google.protobuf.FileDescriptorSet` that contains the message
    // descriptor (named by the `messageTypeName` field) of the message this
    // publisher publishes and all of its necessary dependencies.
    //
    // The message descriptor is used by the telemetry service to deserialize
    // the data sent by the publisher.
    //
    // Only one of `fileDescriptorProto` and `fileDescriptorSet` may be set
    // (= non-null). An empty byte array is treated as being set, since an empty
    // byte array is a valid serialization result of a protobuf message.
    //
    // `fileDescriptorSet` must be less than 10Kb to prevent binder buffer to be
    // full.
    @nullable byte[] fileDescriptorSet;
}
