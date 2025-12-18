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

#include <sdv/callback.h>
#include <sdv/ctx.h>
#include <sdv/service_identity.h>
#include <sdv/status.h>
#include <sdv/unit_registration.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 *  Data Tunnel Handles
 */
typedef struct ASDV_PublicationHandle ASDV_PublicationHandle;

typedef struct ASDV_SubscriptionHandle ASDV_SubscriptionHandle;

typedef struct ASDV_HistoryHandle ASDV_HistoryHandle;

/********************
 *  Publisher API   *
 ********************/

/* Declare a Callback for ASDV_SubscribeToPublication. */
DEFINE_ONCE_CALLBACK(PublicationCreate, ASDV_PublicationHandle* _Nonnull);

/**
 * NOTE: There's a distinction between a publisher and a publication.
 * A publisher can create a publication, the lifespan of which can exceed
 * the lifespan of the publisher process. For instance, if the publisher
 * process crashes, a new publisher process can request ownership of the
 * existing publication. All subscribers to the publication will be notified
 * of the change in publisher but will continue to read messages using the
 * same subscription handle.
 */

/**
 * Remote blocking. This function accepts a OnceCallbackVTable that will be invoked when the
 * operation completes.
 * Thread safe.
 *
 * Creates a publication/unit with the specified unit registration arguments.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_reg_args: Unit registartion arguments for the registration
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or a
 *         pointer to the a created ASDV_PublicationHandle
 *
 * #Safety
 * - `context` must be a valid pointer to the ASDV_Context instance.
 * - `unit_reg_args` must be a valid pointer to an ASDV_UnitRegistrationArgs instance.
 * - `callback_vtable` must be a valid value to valid vtable as required by OnceCallbackVTable.
 * - This function takes ownership of the provided `unit_reg_args`. That pointer must NOT be used
 *   after this call.
 * - This function provides ownership of ASDV_PublicationHandle through the callback. The caller
 *   is responsible for ensuring that the backing memory is appropriately cleared using the function
 *   ASDV_DestroyPublication.
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and a pointer to an ASDV_PublicationHandle on success, or an sdv_status_t code
 *    representing an error.
 */
void ASDV_CreatePublication(const ASDV_Context* _Nonnull context,
                            ASDV_UnitRegistrationArgs* _Nonnull unit_reg_args,
                            const ASDV_CallbackVTable_PublicationCreate callback_vtable);

/**
 * Non blocking.
 * Thread safe.
 *
 * Get PublicationMetadata from Publisher
 *
 * Parameters:
 *    [IN] publication_handle: Publication handle
 *    [OUT] publisher_metadata: Provides the value of ASDV_PublisherUnitMetadata set for this
 *          publisher
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_GetPublisherUnitMetadata(
        const ASDV_PublicationHandle* _Nonnull publication_handle,
        ASDV_PublisherUnitMetadata* _Nonnull publisher_metadata);

/**
 * Non blocking.
 * Thread safe.
 *
 * Get PublicationMetadata from Subscriber
 *
 * Parameters:
 *    [IN] subscription_handle: Subscription handle
 *    [OUT] publisher_metadata: Provides the value of ASDV_PublisherUnitMetadata set for this
 *          publisher
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_GetPublisherUnitMetadataFromSubscriber(
        const ASDV_SubscriptionHandle* _Nonnull subscription_handle,
        ASDV_PublisherUnitMetadata* _Nonnull publisher_metadata);

/**
 * Non blocking.
 * Thread safe.
 *
 * Get PublicationMetadata from History
 *
 * Parameters:
 *    [IN] history_handle: History handle
 *    [OUT] publisher_metadata: Provides the value of ASDV_PublisherUnitMetadata set for this
 *          publisher
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_GetPublisherUnitMetadataFromHistory(
        const ASDV_HistoryHandle* _Nonnull history_handle,
        ASDV_PublisherUnitMetadata* _Nonnull publisher_metadata);

/**
 * Non blocking.
 * Thread safe.
 *
 * Writes messages to the publication's buffer.
 *
 * Parameters:
 *    [IN] publication_handle: Publication handle
 *    [IN] messages: Pointer to the buffer from which the data will be copied
 *    [IN] buffer_size: Size of buffer in bytes
 *    [OUT] written: Stores the number of messages that been written to the publication
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_WriteMessages(ASDV_PublicationHandle* _Nonnull publication_handle,
                                const void* _Nonnull messages, const uint32_t buffer_size,
                                /*out*/ uint32_t* _Nonnull written);

/**
 * Remote blocking.
 * Thread safe.
 *
 * Permanently deletes the publication and releases all associated resources.
 * After calling this function, the publication will not be reclaimed via
 * ClaimPublication().
 *
 * Parameters:
 *    [IN] publication_handle: Publication handle
 *
 * #Safety
 * - `publication_handle` must be a valid pointer to the ASDV_PublicationHandle instance created by
 *   calling ASDV_CreatePublication.
 * - This function takes ownership of the provided `publication_handle`. That pointer must NOT be
 *   used after this call.
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is returned.
 */
sdv_status_t ASDV_DestroyPublication(ASDV_PublicationHandle* _Nonnull publication_handle);

/********************
 *  Subscriber API  *
 ********************/

/* Notification Types */
typedef enum ASDV_NotificationType {
    /* New data is available to read */
    DataAvailable = 0x1,
    /* An exception occurred */
    Exception = 0x2
} ASDV_NotificationType;

typedef void (*ASDV_NotificationCallback)(int32_t /*notification_type*/,
                                          void* _Nullable /*user_data*/);

/* Subscription Flags */

/**
 * If this flag is set, the subscriber will receive the last message that was
 * published to the topic. Otherwise, the subscriber will only receive messages
 * published after it subscribes.
 */
const uint64_t ASDV_SubscriptionFlags_None = 0x0;
const uint64_t ASDV_SubscriptionFlags_FetchLastMessage = 0x1;

/* Declare a Callback for ASDV_SubscribeToPublication. */
DEFINE_ONCE_CALLBACK(SubscribeToPublication, ASDV_SubscriptionHandle* _Nonnull);

/*
 * Declare a Callback for the function ASDV_SetNotificationHandler. The generated
 * type is ASDV_CallbackVTable_SetNotificationHandler.
 */
DEFINE_CALLBACK(SetNotificationHandler, ASDV_NotificationType);

/**
 * Remote blocking. This function accepts a OnceCallbackVTable that will be invoked when the
 * operation completes.
 * Thread safe.
 *
 * Subscribes to a publication with the specified unit name using provided ASDV_UnitIdentifier and
 * returns the newly created subscription as a pointer to ASDV_SubscriptionHandle via callback. All
 * publication properties are store as publisher's metadata and can be requested from Service
 * Discovery.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_identifier: Service Unit Identifier to subscribe
 *    [IN] subscription_flags: see ASDV_SubscriptionFlags_* for details
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or a
 *         pointer to the a created ASDV_SubscriptionHandle
 *
 * #Safety
 * - `context` must be a valid pointer to the ASDV_Context instance.
 * - `unit_identifier` must be a valid pointer to an ASDV_UnitIdentifier instance.
 * - `callback_vtable` must be a valid value to valid vtable as required by OnceCallbackVTable.
 * - This function takes a reference to the provided `unit_identifier`.
 * - This function provides ownership of ASDV_SubscriptionHandle through the callback. The caller
 *   is responsible for ensuring that the backing memory is appropriately cleared using the function
 *   ASDV_UnsubscribeFromPublication.
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and a pointer to an ASDV_SubscriptionHandle on success, or an sdv_status_t code
 *    representing an error.
 */
void ASDV_SubscribeToPublication(const ASDV_Context* _Nonnull context,
                                 const ASDV_UnitIdentifier* _Nonnull unit_identifier,
                                 const uint64_t subscription_flags,
                                 ASDV_CallbackVTable_SubscribeToPublication callback_vtable);

/**
 * Remote blocking. This function accepts a OnceCallbackVTable that will be invoked when the
 * operation completes.
 * Thread safe.
 *
 * Subscribes to all the publications with the specified unit type using provided ASDV_UnitType and
 * returns the newly created subscription as a pointer to ASDV_SubscriptionHandle via callback. All
 * publication properties are store as publisher's metadata and can be requested from Service
 * Discovery.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_type: Unit Type to subscribe
 *    [IN] subscription_flags: see ASDV_SubscriptionFlags_* for details
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or a
 *         pointer to the a created ASDV_SubscriptionHandle
 *
 * #Safety
 * - `context` must be a valid pointer to the ASDV_Context instance.
 * - `unit_type` must be a valid pointer to an ASDV_UnitType instance.
 * - `callback_vtable` must be a valid value to valid vtable as required by OnceCallbackVTable.
 * - This function takes a reference to the provided `unit_type`.
 * - This function provides ownership of ASDV_SubscriptionHandle through the callback. The caller
 *   is responsible for ensuring that the backing memory is appropriately cleared using the function
 *   ASDV_UnsubscribeFromPublication.
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and a pointer to an ASDV_PublicationHandle on success, or an sdv_status_t code
 *    representing an error.
 */
void ASDV_SubscribeToUnitType(const ASDV_Context* _Nonnull context,
                              const ASDV_UnitType* _Nonnull unit_type,
                              const uint64_t subscription_flags,
                              ASDV_CallbackVTable_SubscribeToPublication callback_vtable);


/**
 * Non blocking.
 * Thread safe.
 *
 * This function accepts a OnceCallbackVTable that will be invoked when the
 * operation completes.
 *
 * Subscribes to all the publications with the specified unit type and channel name using provided
 * ASDV_UnitType and returns the newly created subscription as a pointer to ASDV_SubscriptionHandle
 * via callback. All publication properties are store as publisher's metadata and can be requested
 * from Service Discovery.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_type: Unit Type to subscribe
 *    [IN] channel_name: Channel name to subscribe
 *    [IN] subscription_flags: see ASDV_SubscriptionFlags_* for details
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or a
 *         pointer to the a created ASDV_SubscriptionHandle
 *
 * #Safety
 * - `context` must be a valid pointer to the ASDV_Context instance.
 * - `unit_type` must be a valid pointer to an ASDV_UnitType instance.
 * - `channel_name` must be a valid pointer to a null-terminated string.
 * - `callback_vtable` must be a valid value to valid vtable as required by OnceCallbackVTable.
 * - This function takes a reference to the provided `unit_type`.
 * - This function provides ownership of ASDV_SubscriptionHandle through the callback. The caller
 *   is responsible for ensuring that the backing memory is appropriately cleared using the function
 *   ASDV_UnsubscribeFromPublication.
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and a pointer to an ASDV_SubscriptionHandle on success, or an sdv_status_t code
 *    representing an error.
 */
void ASDV_SubscribeToChannel(const ASDV_Context* _Nonnull context,
                             const ASDV_UnitType* _Nonnull unit_type,
                             const char* _Nonnull channel_name,
                             const uint64_t subscription_flags,
                             ASDV_CallbackVTable_SubscribeToPublication callback_vtable);

/**
 * Non blocking.
 * Thread safe.
 *
 * Reports the number of new messages available to read.
 *
 * Parameters:
 *    [IN] subscription_handle: Subscription handle
 *    [OUT] message_count: Stores number of messages available to read.
 *                         0 if no new messages are available.
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned. From the point view of a slow reader, the publication buffer
 *    is allowed to overflow; this may result ASDV_AvailableToRead()
 *    returning SDV_STATUS_OK result and set "message_count" to a value larger
 *    than the size of the queue. The first call of ReadMessages() after an
 *    overflow will return ASDV_STATUS_DATA_LOSS and result in the read pointer
 *    will be moved so that exactly half of the buffer will be available for
 *    subsequent reading.
 */
sdv_status_t ASDV_AvailableToRead(const ASDV_SubscriptionHandle* _Nonnull subscription_handle,
                                  /*out*/ uint32_t* _Nonnull message_count);

/**
 * Non blocking.
 * Thread safe.
 *
 * Reads "message_count" messages from the publication's buffer.
 *
 * Parameters:
 *    [IN] subscription_handle: Subscription handle
 *    [IN] messages: Pointer to the buffer where the data will be copied
 *    [IN] buffer_size: Size of buffer in bytes
 *    [OUT] read: Stores the number of messages that were read from
 *                the publication and stored to the "messages" buffer.
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned. See the description of ASDV_AvailableToRead to understand how it
 *    behaves in case of buffer overflows.
 */
sdv_status_t ASDV_ReadMessages(ASDV_SubscriptionHandle* _Nonnull subscription_handle,
                               void* _Nonnull messages, const uint32_t buffer_size,
                               /*out*/ uint32_t* _Nonnull read);

/**
 * Local blocking.
 * Thread safe.
 *
 * Sets callback for all notifications for the specified subscription.
 * Parameters:
 *    [IN] subscription_handle: Subscription handle
 *    [IN] callback: The specified callback function will be invoked
 *                   whenever there is new data to read or an error occurs.
 *                   If a callback was previously set, it will be replaced
 *                   with the new one. The old callback will be destroyed.
 *    [IN] min_interval_ms: Specifies the minimal interval between nearing
 *                          notifications in milliseconds. Using 0
 *                          meaning "notify on every message". When there are
 *                          new messages coming within the interval of last
 *                          notification, the callback will only be triggered
 *                          after the interval.
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_SetNotificationHandler(
        const ASDV_SubscriptionHandle* _Nonnull subscription_handle,
        ASDV_CallbackVTable_SetNotificationHandler cb_vtable, const uint32_t min_interval_ms);

/**
 * Local blocking.
 * Thread safe.
 *
 * Disables notifications callback for the specified subscription and destroys
 * the callback object if it was previously set.
 * Parameters:
 *    [IN] subscription_handle: Subscription handle
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_ClearNotificationHandler(ASDV_SubscriptionHandle* _Nonnull subscription_handle);

/**
 * Remote blocking.
 * Thread safe.
 *
 * * Unsubscribes from the publication and releases all resources associated
 * with this subscription.
 *
 * Parameters:
 *    [IN] subscription_handle: Subscription handle
 *
 * #Safety
 * - `publication_hsubscription_handleandle` must be a valid pointer to the ASDV_PublicationHandle
 *   instance created by calling ASDV_SubscribeToPublication.
 * - This function takes ownership of the provided `subscription_handle`. That pointer must NOT be
 *   used after this call.
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is returned.
 */
sdv_status_t ASDV_UnsubscribeFromPublication(ASDV_SubscriptionHandle* _Nonnull subscription_handle);

/************************
 *  History Reader API  *
 ************************/

/* Declare a Callback for ASDV_SubscribeToHistory. */
DEFINE_ONCE_CALLBACK(SubscribeToHistory, ASDV_HistoryHandle* _Nonnull);

/**
 * Remote blocking.
 * Thread safe.
 *
 * Creates a "message_count"-size history aggregator for a publication with the
 * given name and subscribes to it. Stores the newly created history handle. All
 * publication properties are store as publisher's metadata and can be requested
 * from Service Discovery.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_identifier: Service Unit Identifier to subscribe
 *    [IN] message_count: Depth of the history aggregator in messages
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or a
 *         pointer to the a created ASDV_HistoryHandle
 *
 * #Safety
 * - `context` must be a valid pointer to the ASDV_Context instance.
 * - `unit_identifier` must be a valid pointer to an ASDV_UnitIdentifier instance.
 * - `callback_vtable` must be a valid value to valid vtable as required by OnceCallbackVTable.
 * - This function takes a reference to the provided `unit_identifier`.
 * - This function provides ownership of ASDV_HistoryHandle through the callback. The caller
 *   is responsible for ensuring that the backing memory is appropriately cleared using the function
 *   ASDV_UnsubscribeFromHistory.
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and a pointer to an ASDV_HistoryHandle on success, or an sdv_status_t code
 *    representing an error.
 */
void ASDV_SubscribeToHistory(const ASDV_Context* _Nonnull context,
                             const ASDV_UnitIdentifier* _Nonnull unit_identifier,
                             uint32_t history_buffer_size,
                             ASDV_CallbackVTable_SubscribeToHistory callback_vtable);

/**
 * Remote blocking.
 * Thread safe.
 *
 * Creates a "message_count"-size history aggregator for all publications of the
 * given unit type and channel and subscribes to it. Stores the newly created history handle. All
 * publication properties are store as publisher's metadata and can be requested
 * from Service Discovery.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_type: Unit Type to subscribe
 *    [IN] channel_name: Channel name to subscribe
 *    [IN] history_buffer_size: Depth of the history aggregator in messages
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or a
 *         pointer to the a created ASDV_HistoryHandle
 *
 * #Safety
 * - `context` must be a valid pointer to the ASDV_Context instance.
 * - `unit_type` must be a valid pointer to an ASDV_UnitType instance.
 * - `channel_name` must be a valid pointer to a null-terminated string.
 * - `callback_vtable` must be a valid value to valid vtable as required by OnceCallbackVTable.
 * - This function takes a reference to the provided `unit_type`.
 * - This function provides ownership of ASDV_HistoryHandle through the callback. The caller
 *   is responsible for ensuring that the backing memory is appropriately cleared using the function
 *   ASDV_UnsubscribeFromHistory.
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and a pointer to an ASDV_HistoryHandle on success, or an sdv_status_t code
 *    representing an error.
 */
void ASDV_SubscribeToHistoryChannel(const ASDV_Context* _Nonnull context,
                                    const ASDV_UnitType* _Nonnull unit_type,
                                    const char* _Nonnull channel_name, uint32_t history_buffer_size,
                                    ASDV_CallbackVTable_SubscribeToHistory callback_vtable);

/**
 * Non blocking.
 * Thread safe.
 *
 * Reports the number of messages available in the history buffer.
 *
 * Parameters:
 *    [IN] history_handle: History handle
 *    [OUT] message_count: Stores amount of messages available in the in
 *                         the history buffer.
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_AvailableInHistory(const ASDV_HistoryHandle* _Nonnull history_handle,
                                     /*out*/ uint32_t* _Nonnull message_count);

/**
 * Non blocking.
 * Reads "message_count" messages from the publication's history buffer.
 *
 * Parameters:
 *    [IN] history_handle: History handle
 *    [IN] messages: Pointer to the buffer where the data will be copied
 *    [IN] buffer_size: Size of buffer in bytes
 *    [OUT] read: Stores the number of messages that were read from
 *                the publication history and stored to the "messages" buffer.
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_ReadHistoryMessages(const ASDV_HistoryHandle* _Nonnull history_handle,
                                      void* _Nonnull messages, const uint32_t buffer_size,
                                      /*out*/ uint32_t* _Nonnull read);

/**
 * Remote blocking.
 * Thread safe.
 *
 * Unsubscribes from the history and releases all the associated resources.
 *
 * Parameters:
 *    [IN] history_handle: History handle
 *
 * Return value:
 *    Returns SDV_STATUS_OK on success, otherwise an error code is
 *    returned.
 */
sdv_status_t ASDV_UnsubscribeFromHistory(const ASDV_HistoryHandle* _Nonnull history_handle);

/**********************
 *  Instant Read API  *
 **********************/

/* Declare a Callback for ASDV_GetLastPublicationMessage. */
DEFINE_ONCE_CALLBACK(GetLastPublicationMessage, uint32_t);

/* The maximum size of a message that can be received via InstantRead is limited to 64KB
 * due to Binder limitations and overall system performance reasons.
 */
const uint32_t ASDV_MaxInstantReadMessageSize = 64 * 1024;

/**
 * Local/Remote blocking [*].
 * Thread safe.
 *
 * This function returns the last published message in the specified
 * publication without subscribing to it, or returns an error if the
 * publication is empty.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_identifier: Service Unit Identifier to read data from
 *    [IN] buffer: Pointer to the buffer where the data will be copied.
 *    [IN] buffer_size: Message buffer size in bytes. The buffer size must be at least the size
 *                      of the message. Messages exceeding the limit set by
 *                      ASDV_MaxInstantReadMessageSize cannot be received.
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or
 *         amount of bytes read
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and amount of bytes read on success, or an sdv_status_t code
 *    representing an error.
 *
 * Note: [*] This call will be blocked locally only if the publisher is local, or if this
 *           publication has local subscribers. Otherwise, each call will be remote blocking.
 */
void ASDV_GetLastPublicationMessage(const ASDV_Context* _Nonnull context,
                                    const ASDV_UnitIdentifier* _Nonnull unit_identifier,
                                    void* _Nonnull buffer, const uint32_t buffer_size,
                                    ASDV_CallbackVTable_GetLastPublicationMessage callback_vtable);

/**
 * Local/Remote blocking [*].
 * Thread safe.
 *
 * This function returns the last published message in the specified
 * channel without subscribing to it, or returns an error if the
 * channel is empty.
 *
 * Parameters:
 *    [IN] context: Pointer to the local SDV Comm Stack Context object
 *    [IN] unit_type: Service Unit Type to read data from
 *    [IN] channel_name: Channel name to read data from
 *    [IN] buffer: Pointer to the buffer where the data will be copied.
 *         The buffer must remain valid until the callback is invoked.
 *    [IN] buffer_size: Message buffer size in bytes. The buffer size must be at least the size
 *                      of the message. Messages exceeding the limit set by
 *                      ASDV_MaxInstantReadMessageSize cannot be received.
 *    [IN] callback_vtable: A CallbackVTable that will be invoked with an error sdv_status_t or
 *         amount of bytes read
 *
 * Return:
 *    This function does not return anything. It invokes the provided CallbackVTable with
 *    SDV_STATUS_OK, and amount of bytes read on success, or an sdv_status_t code
 *    representing an error.
 *
 * Note: [*] This call will be blocked locally only if the publisher is local, or if this
 *           publication has local subscribers. Otherwise, each call will be remote blocking.
 */
void ASDV_GetLastChannelMessage(const ASDV_Context* _Nonnull context,
                                const ASDV_UnitType* _Nonnull unit_type,
                                const char* _Nonnull channel_name,
                                void* _Nonnull buffer, const uint32_t buffer_size,
                                ASDV_CallbackVTable_GetLastPublicationMessage callback_vtable);

#ifdef __cplusplus
}  // extern "C"
#endif
