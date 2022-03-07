
class position {
  position(this.boatOnWestBank, this.eastCannibals, this.eastMissionaries, this.westCannibals, this.westMissionaries);

  position.clone(position clone): this(clone.boatOnWestBank, clone.eastCannibals, clone.eastMissionaries, clone.westCannibals, clone.westMissionaries);

  bool boatOnWestBank;
  int westMissionaries;
  int westCannibals;
  int eastMissionaries;
  int eastCannibals;
}

bool valid(position pos) {
  if (pos.eastCannibals < 0 ||
      pos.westCannibals < 0 ||
      pos.eastMissionaries < 0 ||
      pos.westMissionaries < 0) {
    return false;
  }
  if (pos.westCannibals > pos.westMissionaries && pos.westMissionaries > 0) {
    return false;
  }
  if (pos.eastCannibals > pos.eastMissionaries && pos.eastMissionaries > 0) {
    return false;
  }
  if (pos.eastMissionaries + pos.westMissionaries > 3 ||
      pos.westCannibals + pos.eastCannibals > 3) {
    return false;
  }
  return true;
}

List<position> moves(position pos) {
  int direction = 1;
  if(!pos.boatOnWestBank) {
    direction = -1;
  }
  final position pos1 = position.clone(pos);
  final position pos2 = position.clone(pos);
  final position pos3 = position.clone(pos);
  final position pos4 = position.clone(pos);
  final position pos5 = position.clone(pos);

  List<position> moves = [pos1 , pos2, pos3, pos4, pos5];

  moves[0].westMissionaries -= 2 * direction;
  moves[0].eastMissionaries += 2 * direction;

  moves[1].westCannibals -= 2 * direction;
  moves[1].eastCannibals += 2 * direction;

  moves[2].westMissionaries -= 1 * direction;
  moves[2].eastMissionaries += 1 * direction;

  moves[3].westCannibals -= 1 * direction;
  moves[3].eastCannibals += 1 * direction;

  moves[4].westCannibals -= 1 * direction;
  moves[4].westMissionaries -= 1 * direction;
  moves[4].eastCannibals += 1 * direction;
  moves[4].eastMissionaries += 1 * direction;

  List<position> validMoves = new List.empty();

  moves.forEach((element) {
      if(valid(element)) {
        element.boatOnWestBank = !element.boatOnWestBank;
        validMoves.add(element);
      }
   });
  return validMoves;
}

void dfs(position start, position goal, List<position> solution, Map[positionbool visited) {
  sucessors
}
void main() {
  position start = position
}
