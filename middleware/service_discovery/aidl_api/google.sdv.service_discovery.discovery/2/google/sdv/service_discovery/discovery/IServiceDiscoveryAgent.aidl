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
///////////////////////////////////////////////////////////////////////////////
// THIS FILE IS IMMUTABLE. DO NOT EDIT IN ANY CASE.                          //
///////////////////////////////////////////////////////////////////////////////

// This file is a snapshot of an AIDL file. Do not edit it manually. There are
// two cases:
// 1). this is a frozen version file - do not edit this in any case.
// 2). this is a 'current' file. If you make a backwards compatible change to
//     the interface (from the latest frozen version), the build system will
//     prompt you to update this file with `m <name>-update-api`.
//
// You must not make a backward incompatible change to any AIDL file built
// with the aidl_interface module type with versions property set. The module
// type is used to build AIDL files in a way that they can be used across
// independently updatable components of the system. If a device is shipped
// with such a backward incompatible change, it has a high risk of breaking
// later when a module using the interface is updated, e.g., Mainline modules.

package google.sdv.service_discovery.discovery;
@VintfStability
interface IServiceDiscoveryAgent {
  List<google.sdv.service_discovery.discovery.ServiceUnitDefinition> listServiceUnitsByType(in google.sdv.service_discovery.common.UnitType unitType);
  List<google.sdv.service_discovery.discovery.ServiceUnitDefinition> listServiceUnitsByName(in google.sdv.service_discovery.discovery.UnitNameParameters query);
  void fetchServiceUnitsByType(in google.sdv.service_discovery.common.UnitType unitType, in google.sdv.service_discovery.discovery.IServiceUnitFetchListener listener);
  void fetchServiceUnitsByName(in google.sdv.service_discovery.discovery.UnitNameParameters query, in google.sdv.service_discovery.discovery.IServiceUnitFetchListener listener);
  @nullable google.sdv.service_discovery.discovery.ServiceUnitDefinition getServiceUnit(in google.sdv.identity.ServiceFqin fqin, @utf8InCpp String unitName);
  void registerServiceUnitChangeListenerByType(in google.sdv.service_discovery.common.UnitType unitType, in google.sdv.service_discovery.discovery.IServiceUnitChangeListener listener);
  void unregisterServiceUnitChangeListenerByType(in google.sdv.service_discovery.common.UnitType unitType, in google.sdv.service_discovery.discovery.IServiceUnitChangeListener listener);
  void registerServiceUnitChangeListenerByName(in google.sdv.service_discovery.discovery.UnitNameParameters query, in google.sdv.service_discovery.discovery.IServiceUnitChangeListener listener);
  void unregisterServiceUnitChangeListenerByName(in google.sdv.service_discovery.discovery.UnitNameParameters query, in google.sdv.service_discovery.discovery.IServiceUnitChangeListener listener);
  void unregisterServiceUnitChangeListener(in google.sdv.service_discovery.discovery.IServiceUnitChangeListener listener);
  void registerServiceUnitChangeListenerByTopic(in google.sdv.service_discovery.common.UnitType unitType, @utf8InCpp String topicName, in google.sdv.service_discovery.discovery.IServiceUnitChangeListener listener);
  void unregisterServiceUnitChangeListenerByTopic(in google.sdv.service_discovery.common.UnitType unitType, @utf8InCpp String topicName, in google.sdv.service_discovery.discovery.IServiceUnitChangeListener listener);
  void fetchPublishersByTopicName(@utf8InCpp String topicName, in google.sdv.service_discovery.discovery.IServiceUnitFetchListener listener);
  void listTopics(in google.sdv.service_discovery.discovery.ITopicFetchListener listener);
  void listTopicsByType(in google.sdv.service_discovery.common.UnitType unitType, in google.sdv.service_discovery.discovery.ITopicFetchListener listener);
}
