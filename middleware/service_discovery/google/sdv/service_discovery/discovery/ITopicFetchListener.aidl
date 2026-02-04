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

import google.sdv.service_discovery.discovery.TopicList;

/**
 * Listener interface for receiving topic lists.
 */
@VintfStability
oneway interface ITopicFetchListener {
    /**
     * Called when a chunk of topics has been fetched. Due to potential Binder
     * buffer limitations, the full list of topics is delivered in multiple
     * calls to this method.
     * Make sure to wait for all chunks to be returned before processing the result.
     *
     * @param topics The list of fetched topic names in this chunk.
     * @param isLastChunk True if this is the last chunk of the topic list, false otherwise.
     */
    void onTopicsFetched(in TopicList topics, boolean isLastChunk);
}
