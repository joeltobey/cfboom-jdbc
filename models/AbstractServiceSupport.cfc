/*
 * Copyright 2016 Joel Tobey <joeltobey@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * This is the entry point to all JDBC calls.
 *
 * @singleton
 */
component
  extends="cfboom.lang.Object"
  displayname="Class QueryService"
  output="false"
{
  property name="interceptorService" inject="coldbox:interceptorService";
  property name="wirebox" inject="wirebox";

  public cfboom.jdbc.models.AbstractServiceSupport function init( required string daoBeanName ) {
    _instance['daoBeanName'] = arguments.daoBeanName;
    return this;
  }

  public void function onDIComplete() {
    _instance['dao'] = wirebox.getInstance( _instance.daoBeanName );
  }

  public any function findWhere( required struct criteria ) {
  	return _instance.dao.findWhere( arguments.criteria );
  }

  public any function load() {}

  public any function insert() {}

  public any function update() {}

  public any function delete() {}
}