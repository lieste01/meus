import { Entity, PrimaryColumn, Column } from 'typeorm';

@Entity('channelType')
class ChannelType {
  @PrimaryColumn()
  uuid: string;

  @Column()
  name: string;

  @Column()
  type: string;

  @Column()
  createdAt: Date;

  @Column()
  updatedAt: Date;

  @Column()
  deletedAt: Date;

  @Column()
  version: number;
}

export default ChannelType;
