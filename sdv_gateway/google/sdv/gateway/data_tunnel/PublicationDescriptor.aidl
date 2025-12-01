// Copyright 2024 Google LLC

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
