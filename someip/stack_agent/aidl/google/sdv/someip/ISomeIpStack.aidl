// Copyright (C) 2024 The Android Open Source Project
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

package google.sdv.someip;

import google.sdv.someip.AvailabilityStatus;
import google.sdv.someip.IEventNotificationCallback;
import google.sdv.someip.IRpcRequestCallback;
import google.sdv.someip.ISomeIpServiceAvailabilityCallback;
import google.sdv.someip.SomeIpService;

/**
 * Interface for SOME/IP stack for communication.
 *
 * This is meant to be used by SDV services communicating via RPC with services implementing the
 * SOME/IP protocol.
 */
@VintfStability
interface ISomeIpStack {
    /**
     * Sends RPC to remote service with the specified 'payload' and returns a result.
     *
     * @param[in] service The service to send the RPC to.
     * @param[in] method_id The method ID of the RPC.
     * @param[in] payload The serialized RPC payload in SOME/IP wire format.
     * @return The serialized response payload in SOME/IP wire format.
     */
    byte[] rpc_transact(in SomeIpService service, char method_id, in byte[] payload);

    /**
     * Sends one way RPC to remote service with the specified 'payload'.
     *
     * The call doesn't wait for a completion of a remote procedure.
     *
     * @param[in] service The service to send the RPC to.
     * @param[in] method_id The method ID of the RPC.
     * @param[in] payload The serialized RPC payload in SOME/IP wire format.
     */
    void rpc_oneway(in SomeIpService service, char method_id, in byte[] payload);

    /**
     * Registers a callback to be triggered when the availability of the SOME/IP service changes.
     *
     * **Error conditions**
     * - `ExceptionCode::ALREADY_EXISTS` - if the callback has already been registered.
     *
     * @param[in] callback The callback to register.
     */
    void register_availability_callback(in ISomeIpServiceAvailabilityCallback callback);

    /**
     * Instructs SOME/IP stack to watch for changes in the provided `service`.
     *
     * This ensures that the stack implementation knows which SOME/IP services can/should trigger
     * the availability callback. This method should be called after
     * `register_availability_callback`.
     *
     * @param[in] service The service to monitor.
     */
    oneway void monitor_service(in SomeIpService service);

    /**
     * Unregisters the availability callback.
     *
     * **Error conditions**
     * - `ExceptionCode::ILLEGAL_STATE` - if the callback has not been registered.
     */
    void unregister_availability_callback();

    /**
     * Registers a callback to be triggered when a RPC request is received.
     *
     * @param[in] callback The callback to register.
     */
    void register_rpc_request_callback(in IRpcRequestCallback callback);

    /**
     * Unregisters the rpc request callback.
     */
    void unregister_rpc_request_callback();

    /**
     * Registers a callback to be triggered when an event that has been subscribed to via the
     * 'subscribe' API is received.
     *
     * @param[in] callback The callback to register.
     */
    void register_event_notification_callback(in IEventNotificationCallback callback);

    /**
     * Unregisters the event notification callback.
     */
    void unregister_event_notification_callback();

    /**
     * Indicates a change in SDV service's availability.
     *
     * @param[in] service The service whose availability has changed.
     * @param[in] status The new availability status.
     */
    void on_sdv_service_availability(in SomeIpService service, in AvailabilityStatus status);

    /**
     * Indicates a change in SDV topic's availability.
     *
     * @param[in] service The service associated with the topic.
     * @param[in] eventgroup The eventgroup of the topic.
     * @param[in] event The event of the topic.
     * @param[in] status The new availability status.
     */
    void on_sdv_topic_availability(
            in SomeIpService service, char eventgroup, char event, in AvailabilityStatus status);

    /**
     * @deprecated Subscribes to the event from the eventgroup for the given SOME/IP service.
     *
     * The service specifies the required version. Only the major version is used, minor version
     * ignored. The event_id must be provided to filter specific event from the group on the client
     * side. The subscription happens regardless of whether an event notification callback has
     * been registered or not. If it has been registered, the notification callback will be called
     * whenever a new notification is received.
     *
     * @param[in] service The service to subscribe to.
     * @param[in] eventgroup The eventgroup to subscribe to.
     * @param[in] event_id The event to subscribe to.
     */
    void subscribe(in SomeIpService service, char eventgroup, char event_id);

    /**
     * @deprecated Unsubscribes from the event from the eventgroup for the given SOME/IP service.
     *
     * The service specifies the required version. Only the major version is used, minor version
     * ignored.
     *
     * @param[in] service The service to unsubscribe from.
     * @param[in] eventgroup The eventgroup to unsubscribe from.
     * @param[in] event_id The event to unsubscribe from.
     */
    void unsubscribe(in SomeIpService service, char eventgroup, char event_id);

    /**
     * Publishes an event.
     *
     * @param[in] service The service publishing the event.
     * @param[in] event_id The ID of the event being published.
     * @param[in] payload The payload of the event in SOME/IP wire format.
     */
    oneway void publish(in SomeIpService service, char event_id, in byte[] payload);

    /**
     * Subscribes to the specified events from the eventgroup for the given SOME/IP service.
     *
     * The service specifies the required version. The event_ids must be provided to filter
     * specific events from the group on the client side. If the event_ids are empty, the subscribe
     * operation is a no-op and does not affect existing subscriptions. The subscription happens
     * regardless of whether an event notification callback has been registered or not. If it has
     * been registered, the notification callback will be called whenever a new notification is
     * received.
     *
     * @param[in] service The service to subscribe to.
     * @param[in] eventgroup The eventgroup to subscribe to.
     * @param[in] event_ids The events to subscribe to.
     */
    void subscribe_eventgroup(in SomeIpService service, char eventgroup, in char[] event_ids);

    /**
     * Unsubscribes from the specified events from the eventgroup for the given SOME/IP service.
     *
     * The service specifies the required version.
     *
     * @param[in] service The service to unsubscribe from.
     * @param[in] eventgroup The eventgroup to unsubscribe from.
     * @param[in] event_ids The events to unsubscribe from.
     */
    void unsubscribe_eventgroup(in SomeIpService service, char eventgroup, in char[] event_ids);
}
