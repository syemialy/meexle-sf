<h1 class="page-header" ng-show="loading_main"><i class="fa fa-circle-o-notch fa-spin"></i>Loading</h1>
<h1 class="page-header" ng-hide="loading_main">{{ current_object.label }}</h1>
<!--
<div class="panel-group" id="description_accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
            <a class="collapse_link" ng-click="isDescriptionCollapsed = !isDescriptionCollapsed" ng-class="{'collapsed': isDescriptionCollapsed}">Description</a></h4>
        </div>
        <div id="description_collapse" class="panel-collapse collapse" collapse="isDescriptionCollapsed">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-4">
                        <dl class="dl-horizontal">
                            <dt>Name
                            <dd>{{ current_object.name }}
                            <dt>Label
                            <dd>{{ current_object.label }}
                            <dt>Label (Plural)
                            <dd>{{ current_object.labelPlural }}
                            <dt>Key Prefix
                            <dd>{{ current_object.keyPrefix }}
                        </dl>
                    </div>
                    <div class="col-lg-8" ng-show="current_object".recordTypeInfos>
                        <dl class="dl-horizontal">
                            <dt>Record Types
                            <dd>
                                <ul class="list-unstyled">
                                    <li ng-repeat="rt in current_object.recordTypeInfos">{{ rt.name }}</li>
                                </ul>
                        </dl>
                    </div>
                </div>
                <div class="row" ng-repeat="row in property_list">
                    <div class="col-lg-2" ng-repeat="property in row">
                        <ul class="list-group">
                            <li class="list-group-item">
                            <i class="fa fa-question pull-right text-muted" ng-show="loading_main"></i>
                            <i class="fa fa-check pull-right text-success" ng-show="!loading_main && current_object[property]"></i> 
                            <i class="fa fa-remove pull-right text-danger" ng-show="!loading_main && !current_object[property]"></i> 
                            {{ property }}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
-->
<div class="panel-group" id="fields_accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title"><a class="collapse_link" ng-click="isFieldsCollapsed = !isFieldsCollapsed" ng-class="{'collapsed': isFieldsCollapsed}">Fields</a></h4>
        </div>
        <div id="fields_collapse" class="panel-collapse collapse in" collapse="isFieldsCollapsed">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-9">
                    	<input class="form-control" placeholder="Search"... ng-model="field_query">
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Label <i class="fa" ng-class="labelStyle" ng-click="fieldsPredicate = 'label'; fieldsReverse = !fieldsReverse; labelStyle = (fieldsReverse) ? 'fa-sort-up' : 'fa-sort-down'; nameStyle = 'fa-sort'; typeStyle = 'fa-sort'; descStyle = 'fa-sort';"></i>
                                    <th>API Name <i class="fa" ng-class="nameStyle" ng-click="fieldsPredicate = 'name'; fieldsReverse = !fieldsReverse; nameStyle = (fieldsReverse) ? 'fa-sort-up' : 'fa-sort-down'; labelStyle = 'fa-sort'; typeStyle = 'fa-sort'; descStyle = 'fa-sort';"></i>
                                    <th>Type <i class="fa" ng-class="typeStyle" ng-click="fieldsPredicate = 'type'; fieldsReverse = !fieldsReverse; typeStyle = (fieldsReverse) ? 'fa-sort-up' : 'fa-sort-down'; labeStyle = 'fa-sort'; nameStyle = 'fa-sort'; descStyle = 'fa-sort';"></i>
                                    <th>Sync<i class="fa" ng-class="syncStyle" ng-click="fieldsPredicate = 'sync'; fieldsReverse = !fieldsReverse; typeStyle = (fieldsReverse) ? 'fa-sort-up' : 'fa-sort-down'; labeStyle = 'fa-sort'; nameStyle = 'fa-sort'; descStyle = 'fa-sort';"></i>
                                    <th>Description <i class="fa" ng-class="descStyle" ng-click="fieldsPredicate = 'inlineHelpText'; fieldsReverse = !fieldsReverse; descStyle = (fieldsReverse) ? 'fa-sort-up' : 'fa-sort-down'; labelStyle = 'fa-sort'; nameStyle = 'fa-sort'; typeStyle = 'fa-sort';"></i>
                                    <th style="width":13px><i class="fa fa-close" ng-click="fieldsPredicate = ''; labelStyle = 'fa-sort'; nameStyle = 'fa-sort'; typeStyle = 'fa-sort'; descStyle = 'fa-sort';"></i>
                            <tbody>
                                <tr ng-show="loading_main">
                                    <td colspan="4"><i class="fa fa-circle-o-notch fa-spin"></i> Loading...
                                <tr ng-repeat="field in current_object.fields | orderBy:fieldsPredicate:fieldsReverse | filter: filterSupportedFieldsFn |filter:field_query">
                                    <td>{{ field.label }}
                                    <td>{{ field.name }}<span ng-show="field.type == 'reference'">({{ field.relationshipName }})</span>
                                    <td>{{ field.type }} <span ng-show="field.type == 'reference'">(<span ng-repeat="refTo in field.referenceTo"><a ui-sref="object({ name: refTo })">{{ refTo }}</a>{{ $last ? '' : ', '}}</span>)</span> <span ng-show="field.type == 'string'">[{{ field.length }}]</span> <span ng-show="field.type == 'textarea'">- {{ field.extraTypeInfo }} [{{ field.length }}]</span>
                                    <td><input type="checkbox" ng-disabled="!isObjecInSync" ng-change='fieldSyncChanged(field)' ng-model="field.sync"/>
                                    <td colspan="2">{{ field.inlineHelpText }}
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--
<div class="panel-group" id="children_accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title"><a class="collapse_link" ng-click="isChildrenCollapsed = !isChildrenCollapsed" ng-class="{'collapsed': isChildrenCollapsed}">Child Relationships</a></h4>
        </div>
        <div id="children_collapse" class="panel-collapse collapse in" collapse="isChildrenCollapsed">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-9"><input class="form-control" placeholder="Search"... ng-model="child_query"></div>
                </div>
                <div class="row">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Child Object <i class="fa" ng-class="childSObjectStyle" ng-click="relationshipsPredicate = 'childSObject'; relationshipsReverse = !relationshipsReverse; childSObjectStyle = (relationshipsReverse) ? 'fa-sort-up' : 'fa-sort-down'; rnameStyle = 'fa-sort'; fieldStyle = 'fa-sort';"></i>
                                    <th>Relationship Name <i class="fa" ng-class="rnameStyle" ng-click="relationshipsPredicate = 'relationshipName'; relationshipsReverse = !relationshipsReverse; rnameStyle = (relationshipsReverse) ? 'fa-sort-up' : 'fa-sort-down'; childSObjectStyle = 'fa-sort'; fieldStyle = 'fa-sort';"></i>
                                    <th>Field <i class="fa" ng-class="fieldStyle" ng-click="relationshipsPredicate = 'field'; relationshipsReverse = !relationshipsReverse; fieldStyle = (relationshipsReverse) ? 'fa-sort-up' : 'fa-sort-down'; childSObjectStyle = 'fa-sort'; rnameStyle = 'fa-sort';"></i>
                                    <th class="text-center">Cascade
                                    <th class="text-center">Deprecated
                                    <th class="text-center">Restricted
                                    <th style="width":13px><i class="fa fa-close" ng-click="relationshipsPredicate = ''; childSObjectStyle = 'fa-sort'; rnameStyle = 'fa-sort'; fieldStyle = 'fa-sort';"></i>
                            <tbody>
                                <tr ng-show="loading_main">
                                    <td colspan="4"><i class="fa fa-circle-o-notch fa-spin"></i> Loading...
                                <tr ng-repeat="child in current_object.childRelationships | orderBy:relationshipsPredicate:relationshipsReverse | filter:child_query">
                                    <td><a ui-sref="object({ name: child.childSObject })">{{ child.childSObject }}</a>
                                    <td>{{ child.relationshipName }}
                                    <td>{{ child.field }}
                                    <td class="text-center"><i class="fa fa-check text-success" ng-show="child".cascadeDelete></i> <i class="fa fa-remove text-danger" ng-show=!child.cascadeDelete></i>
                                    <td class="text-center"><i class="fa fa-check text-success" ng-show="child".deprecatedAndHidden></i> <i class="fa fa-remove text-danger" ng-show=!child.deprecatedAndHidden></i>
                                    <td class="text-center" colspan="2"><i class="fa fa-check text-success" ng-show="child".restrictedDelete></i> <i class="fa fa-remove text-danger" ng-show=!child.restrictedDelete></i>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
-->