/*
 * Copyright (C) 2026 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package google.sdv.service_discovery.discovery;

import google.sdv.service_discovery.discovery.ChannelList;

/**
 * Listener interface for receiving channel lists.
 */
@VintfStability
oneway interface IChannelFetchListener {
    /**
     * Called when a chunk of channels has been fetched. Due to potential Binder
     * buffer limitations, the full list of channels is delivered in multiple
     * calls to this method.
     * Make sure to wait for all chunks to be returned before processing the result.
     *
     * @param channels The list of fetched channel names in this chunk.
     * @param isLastChunk True if this is the last chunk of the channel list, false otherwise.
     */
    void onChannelsFetched(in ChannelList channels, boolean isLastChunk);
}
