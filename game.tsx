
import React, { useState } from 'react';
import Board from '../Board/Board';
import calculateWinner from '../../helpers/calculateWinner';
import './Game.css';

const Game: React.FC = () => {
  const [history, setHistory] = useState<Array<Array<'X' | 'O' | null>>>([Array(9).fill(null)]);
  const [stepNumber, setStepNumber] = useState(0);
  const [xIsNext, setXIsNext] = useState(true);
  const current = history[stepNumber];
  const winner = calculateWinner(current);

  const handleClick = (i: number) => {
    const historyPoint = history.slice(0, stepNumber + 1);
    const current = historyPoint[historyPoint.length - 1];
    const squares = current.slice();
    if (winner || squares[i]) return;
    squares[i] = xIsNext ? 'X' : 'O';
    setHistory([...historyPoint, squares]);
    setStepNumber(historyPoint.length);
    setXIsNext(!xIsNext);
  };

  return (
    <div className="game">
      <Board squares={current} onClick={handleClick} />
      {/* Game status and history buttons will go here */}
    </div>
  );
};