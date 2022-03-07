
import 'dart:collection';

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

  List<position> moves = [position.clone(pos), position.clone(pos), position.clone(pos), position.clone(pos), position.clone(pos)];

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

  List<position> validMoves = [];

  moves.forEach((element) {
      if(valid(element)) {
        element.boatOnWestBank = !element.boatOnWestBank;
        validMoves.add(element);
      }
   });
  return validMoves;
}

List<position> dfs(position start, position goal, List<position> solution, HashSet<position> Visited) {
    var sucessors = moves(start);
    if (sucessors.length == 0){
      
    }
    sucessors.forEach((element) {
      if(Visited.contains(element)) {
        
      }
      Visited.add(true);
      List<position> newSolution = [];
      newSolution.add(element);
      if(element == goal) {
        return newSolution;
      }
      var next = dfs(element, goal, newSolution, Visited);
      if(next.length == 0) {
        continue;
      }
      return next;
    });
    return solution;
}
void main() {

  position start = new position(boatOnWestBank = true, eastCannibals = 3, eastMissionaries = 3, westCannibals = 0, westMissionaries = 0);
  position goal = new position(boatOnWestBank = false, eastCannibals = 0, eastMissionaries = 0, westCannibals = 3, westMissionaries = 3);
  var solution = dfs(start, goal, List<position> start, HashSet<position> Visited);
  print(solution);
}
