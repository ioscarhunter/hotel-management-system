import 'package:hotel_management_system/entity/key_card.dart';
import 'package:test/test.dart';

class KeyCardMatcher extends Matcher {
  KeyCardMatcher(this.expected);

  final KeyCard expected;

  @override
  Description describe(Description description) {
    return description.add('Room: expect $expected');
  }

  @override
  bool matches(item, Map matchState) {
    if (item.runtimeType != KeyCard) {
      return false;
    }

    final KeyCard actual = item as KeyCard;

    return actual.name == expected.name;
  }
}

Matcher getKeyCardsMatcher(List<KeyCard> expected) => pairwiseCompare<KeyCard, KeyCard>(
    expected, (expected, actual) => KeyCardMatcher(expected).matches(actual, {}), 'compare KeyCards');
