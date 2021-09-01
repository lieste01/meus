import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
  VersionColumn,
} from 'typeorm';
import ChannelType from './ChannelType';

@Entity('channel')
class Channel {
  @PrimaryGeneratedColumn('uuid')
  uuid: string;

  @Column()
  name: string;

  @ManyToOne(() => ChannelType, channelType => channelType.uuid)
  @JoinColumn({ name: 'channelTypeUuid' })
  channelTypeUuid: string;

  @Column()
  description: string;

  @Column()
  auction: number;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;

  @DeleteDateColumn()
  deletedAt?: Date;

  @VersionColumn()
  version: number;

  @Column()
  config: string;
}

export default Channel;
