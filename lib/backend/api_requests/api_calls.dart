import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginOryCall {
  static Future<ApiCallResponse> call({
    String? email = 'akos.toth@vlabs.at',
    String? password = 'Akarmi01&',
  }) async {
    final ffApiRequestBody = '''
{
  "operationName": "loginOry",
  "variables": {
    "email": "$email",
    "password": "$password"
  },
"query": "mutation loginOry(\$email: String!, \$password: String!) { __typename loginOry(input: {email: \$email, password: \$password}) { __typename ...SessionFragment } } fragment SessionFragment on Session { __typename oryID issuedAt expiresAt }"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginOry',
      apiUrl: 'https://api.dev.findea.community/query',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostsCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "operationName": "posts",
  "variables": {
    "pageSize": 20,
    "pageNumber": 1,
    "filterBy": {}
  },
  "query": "query posts(\$pageSize: Int!, \$pageNumber: Int!, \$orderBy: PostOrder, \$filterBy: PostFilters, \$hasReplies: Boolean = false) {  __typename  posts(pagination: {pageSize: \$pageSize, pageNumber: \$pageNumber, orderBy: \$orderBy, filterBy: \$filterBy}) {    __typename    ...PostConnectionFragment  }}fragment PostConnectionFragment on PostPage {  __typename  totalCount  ...PostListFragment}fragment PostListFragment on PostPage {  __typename  posts {    __typename    ... on Challenge {      ...challengeListFragment    }    ... on Poll {      ...PollListFragment    }  }}fragment challengeListFragment on Challenge {  __typename  ...challengeCoreFragment  answers @include(if: \$hasReplies) {    __typename    ...answerFragment  }}fragment challengeCoreFragment on Challenge {  __typename  ...DashboardPostFragment  isSolved  numberOfInteractions  id  title  description  styledDescription  htmlDescription  duration  numberOfUpVotes  isCurrentUserUpVoted  createdAt  updatedAt  approvedAt  numberOfUserActivities  numberOfViews  documentStatus  dueDate  postType  isCommentEnabled  postOrganization {    __typename    ...OrganizationFragment  }  category {    __typename    id    title  }  author {    __typename    ...userCoreFragment  }}fragment DashboardPostFragment on PostInterface {  __typename  id  title  description  styledDescription  htmlDescription  duration  numberOfUpVotes  isCurrentUserUpVoted  createdAt  updatedAt  approvedAt  numberOfUserActivities  numberOfViews  documentStatus  dueDate  postType  isCommentEnabled  postOrganization {    __typename    ...OrganizationFragment  }  category {    __typename    id    title  }  author {    __typename    ...userCoreFragment  }}fragment userCoreFragment on User {  __typename  id  email  createdAt  coinBalance  profile {    __typename    id    firstName    lastName    company    image {      __typename      id      url      uploaded    }  }}fragment OrganizationFragment on Organization {  __typename  id  title  description  organizationType  isSpecialOrganization  postApproveType}fragment answerFragment on Answer {  __typename  id  description  styledDescription  htmlDescription  isSolution  author {    __typename    ...userCoreFragment  }  editedByAdminAt  createdAt  updatedAt  modifiedAt  isModified  numberOfVotes  isCurrentUserVoted  comments {    __typename    edges {      __typename      node {        __typename        ...commentFragment      }    }  }}fragment commentFragment on Comment {  __typename  id  description  styledDescription  htmlDescription  author {    __typename    ...userCoreFragment  }  answer {    __typename    id  }  createdAt  updatedAt  modifiedAt  isModified  numberOfVotes  isCurrentUserVoted}fragment PollListFragment on Poll {  __typename  ...DashboardPostFragment  comments @include(if: \$hasReplies) {    __typename    ...commentFragment  }  id  title  description  styledDescription  htmlDescription  duration  numberOfUpVotes  isCurrentUserUpVoted  createdAt  updatedAt  approvedAt  numberOfUserActivities  numberOfViews  documentStatus  dueDate  postType  isCommentEnabled  postOrganization {    __typename    ...OrganizationFragment  }  category {    __typename    id    title  }  author {    __typename    ...userCoreFragment  }}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'posts',
      apiUrl: 'https://api.dev.findea.community/query',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic whatname(dynamic response) => getJsonField(
        response,
        r'''$['data']['posts']''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
