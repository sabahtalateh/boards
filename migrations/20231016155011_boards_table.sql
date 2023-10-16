-- +goose Up
CREATE TABLE boards (
    id varchar
);

-- +goose Down
DROP TABLE boards;
