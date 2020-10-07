class SchoolYear < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '中学１年生' },
    { id: 2, name: '中学２年生' },
    { id: 3, name: '中学３年生' }
  ]
end
