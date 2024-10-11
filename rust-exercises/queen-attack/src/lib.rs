#[derive(Debug)]
pub struct ChessPosition(i32, i32);

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition
}

// Rank -> Row
// File -> Column

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        // Check invalid move
        if rank < 0 || file < 0 || rank >= 8 || file >= 8 { // Both Rank and File between 0 and 7.
            None
        } else{
            Some(ChessPosition(rank, file)) // Check if position is some
        }
    }
}

impl Queen {
    // if arrive to this part of the implementation -> position is valid. because we check invalid position previously with ChessPosition method.
    pub fn new(position: ChessPosition) -> Self {
        Queen { position } // Return an instance of Queen with a valid position.
    }

    // I have two queens 'como' parameters.
    pub fn can_attack(&self, other: &Queen) -> bool {
        if  self.position.0 == other.position.0 {                                              // Horizontal Attack -> rank1 == rank2
            true
        } else if self.position.1 == other.position.1 {                                       // Vertical Attack -> file1 == file2
          true
        } else if (self.position.0 - other.position.0).abs() == (self.position.1 - other.position.1).abs() {  // Diagonal Attack -> |rank1 - rank2| == |file1 - file2|
            true
        } else {
            false
        }
    }
}
